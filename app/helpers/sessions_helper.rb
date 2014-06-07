module SessionsHelper

  attr_writer :current_user # not accessor b/c reader has action

  # Sets the cookie for user's session
  def sign_in(user)
    user_id = user.id 
    cookies.permanent[:user_id] = user_id
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user
    user_id = cookies[:user_id]
    @current_user || User.find(user_id) 
  end
end
