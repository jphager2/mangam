class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    user = User.new
    user[:email]    = params[:user][:email]
    user[:password] = params[:user][:password]
    if user.save
      sign_in(user)
      redirect_to root_path
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

  def show 
    @user = User.find(params[:id])
  end
end
