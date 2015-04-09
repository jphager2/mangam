class LikesController < ApplicationController
  def create
    id = params[:id]
    current_or_guest_user.like(id)

    respond_to do |f|
      f.html {
        redirect_to controller: :chapters, action: :show, id: id
      }
      f.js { 
        @chapter = Chapter.find(id) 
        render 'update_like_button'
      } 
    end
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy if like.user_id == current_or_guest_user.id

    respond_to do |f|
      f.html {
        redirect_to root_path
      }
      f.js { 
        @chapter = Chapter.find(like.chapter_id) 
        render 'update_like_button'
      } 
    end
  end
end
