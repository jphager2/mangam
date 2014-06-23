class SessionsController < ApplicationController
  def add
    @session = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email].downcase)

    if @user
      @user = @user.authenticate(params[:user][:password])

      if @user
        sign_in @user
        redirect_to root_path
      else
        flash.now[:message] = "invalid email/password combination" 
        render 'add'
      end
    else
      flash.now[:message] = "invalid email/password combination"
      render 'add'
    end
  end

  def destroy
    sign_out 
    redirect_to root_path
  end
end
