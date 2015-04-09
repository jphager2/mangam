class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # If AJAX Problems then re-read:
  # https://github.com/plataformatec/devise/wiki/How-To:-Create-a-guest-user
  protect_from_forgery with: :exception

  include ChaptersHelper
  include TagsHelper

  helper_method :current_or_guest_user

  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    { locale: I18n.locale } #.merge(options)
  end

  def current_or_guest_user
    if current_user
      if session[:guest_user_id]
        logging_in
        guest_user.destroy
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end

  def guest_user
    @cached_guest_user ||= Guest 
      .find(session[:guest_user_id] ||= create_guest_user.id)
  rescue ActiveRecord::RecordNotFound
    session[:guest_user_id] = nil
    guest_user
  end

  private
  def logging_in
    # put any code in here that occurs when a guest logs in as
    # a user (e.g. save guest work as user's work)
  end

  def create_guest_user
    guest = Guest.create( 
      email: "guest_#{Time.now.to_i}#{rand(99)}@example.com"
    ) 
    guest.save!(validate: false)
    session[:guest_user_id] = guest.id
    guest
  end
end
