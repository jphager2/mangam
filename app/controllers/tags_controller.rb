class TagsController < ApplicationController
  def add
    @id = params[:id]
  end

  def create
    chapter_id = params[:id]
    name       = params[:name]
    tag        = Tag.find_by(name: tag)

    tag = current_user.tag(name) unless tag

    ChapterTagMap.create(tag_id: tag.id, chapter_id: chapter_id)

    redirect_to controller: :chapters, action: :read, id: chapter_id
  rescue
    flash[:alert] = "something went wrong while adding tag"
    redirect_to root_path
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
