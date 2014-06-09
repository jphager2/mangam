module SessionsHelper

  attr_writer :current_user # not accessor b/c reader has action

  # Sets the cookie for user's session
  def sign_in(user)
    user_id = user.id 
    cookies.permanent[:user_id] = user_id
    current_user = user
  end

  def sign_out
    cookies.delete(:user_id)
    current_user = nil
  end

  def signed_in?
    !current_user.is_a?(Guest)
  end

  def current_user
    user_id = cookies[:user_id]
    @current_user ||= User.find_by(id: user_id) 
    @current_user ||= User::Guest.new
  end
end
