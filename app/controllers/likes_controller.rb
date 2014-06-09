class LikesController < ApplicationController
  def create
    user = current_user
    id   = params[:id]
    if user
      Like.create(user_id: user.id, chapter_id: id)
      redirect_to controller: :chapters, action: :read, id: id
    else
      redirect_to "/login"
    end
  end

  def destroy
    Like.find(params[:id]).destroy
    redirect_to root_path
  end

  def read
  end
end
