class ChaptersController < ApplicationController
  def index
    @page = params[:page] || 1
    @page = Integer(@page)
    @chapters = Chapter.order('updated_at DESC')
    @chapters = @chapters[(50*(@page-1))..(50*@page-1)]
  end

  def popular
    likes = Like
      .select("chapter_id, count(chapter_id) as likes")
      .group("chapter_id")
      .order('likes desc')

    median_likes = likes[likes.length/2].likes 
    
    chapter_ids_with_above_median_likes = likes
      .having('count(chapter_id) > ?', 1)
      .map(&:chapter_id)

    @popular = Chapter.where(
      "chapters.id in (?)", chapter_ids_with_above_median_likes
    ).order('updated_at DESC')  
  end

  def add
  end

  def create
    Chapter.create(
      manga:     params[:manga], 
      number:    params[:number],
      image_url: params[:image_url] || '',
      #user_id: current_user.id
    )
    redirect_to root_path
  rescue
    flash[:alert] = "something went wrong while adding chapter"
    redirect_to action: :add
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def read
    @chapter = Chapter.find(params[:id])
  end
end
