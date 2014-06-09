class SessionsController < ApplicationController
  def add
  end

  def create
    @user = User.find_by(email: params[:email].downcase)

    if @user
      @user = @user.authenticate(params[:password])

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

  def edit
  end

  def update
  end

  def destroy
  end

  def read
  end
end
