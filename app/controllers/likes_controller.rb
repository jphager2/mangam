class LikesController < ApplicationController

  before_action :authenticate_user!

  def create
    user = current_user
    id   = params[:id]

    if user.like(id)
      redirect_to controller: :chapters, action: :read, id: id
    else
      redirect_to "/login"
    end
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy if like.user_id == current_user.id

    redirect_to root_path
  end

  def read
  end
end
