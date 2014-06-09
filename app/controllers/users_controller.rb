class UsersController < ApplicationController
  def add
    @user = User.new
  end

  def create
    user = User.new
    user[:email]    = params[:email]
    user[:password] = params[:password]
    if user.save
      redirect_to controller: :sessions, action: :create,
        email: user.email, password: user.password
    else
      redirect_to action: :add 
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
