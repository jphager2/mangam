class TagsController < ApplicationController
  def index
    set_current_page!
    tags = Tag.all.sort_by {|tag| tag.name}
    @tags = items_for_current_page(tags)
  end

  def popular
    set_current_page!

    tags = ChapterTagMap 
      .select("tag_id, count(tag_id) as chapters")
      .group("tag_id")
      .order("chapters desc")

    @tags = items_for_current_page(tags)
      .map {|tag| Tag.find(tag.tag_id)}

    render :index
  end

  def trending
    set_current_page!

    tags = ChapterTagMap 
      .where(created_at: (Date.today - 3)..(Date.today + 1))
      .select("tag_id, count(tag_id) as chapters")
      .group("tag_id")
      .order("chapters desc")

    @tags = items_for_current_page(tags)
      .map {|tag| Tag.find(tag.tag_id)}

    render :index
  end

  def new 
    authenticate_user!
    @chapter = Chapter.find(params[:chapter_id])
    @tag = Tag.new
  end

  def create
    authenticate_user!
    chapter_id = params[:tag][:chapter_id]
    names      = params[:tag][:name]
    user       = current_user
    
    names.split(/[,;]/).each do |name|
      name = name.strip.downcase
      tag  = Tag.find_by(name: name)
      tag ||= user.tag(name)
      ChapterTagMap.create(
        tag_id:     tag.id, 
        chapter_id: chapter_id, 
        user_id:    user.id,
      )
    end

    redirect_to controller: :chapters, action: :show, id: chapter_id
  rescue
    flash[:alert] = "something went wrong while adding tag"
    redirect_to root_path
  end

  def destroy
  end

  def show 
    @tag = Tag.find(params[:id])

    if @tag
      @chapters = @tag.chapters
    else
      redirect_to action: :index
      flash[:message] = "No tags found for #{params[:name]}"
    end
  end
end
