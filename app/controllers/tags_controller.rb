class TagsController < ApplicationController
  def index
    @tags = Tag.all.sort_by {|tag| tag.name}
  end

  def add
    @id = params[:id]
  end

  def create
    chapter_id = params[:id]
    name       = params[:name]
    tag        = Tag.find_by(name: name)

    tag ||= current_user.tag(name)

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
    @tag = Tag.find_by(name: params[:name])
    if @tag
      @chapters = @tag.chapters
    else
      redirect_to action: :index
    end
  end
end
