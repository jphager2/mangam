class ChaptersController < ApplicationController
  def index
    set_current_page!
    @chapters = Chapter.order('updated_at DESC')
    set_chapters_for_current_page!
  end

  def popular
    set_current_page!

    likes = Like
      .select("chapter_id, count(chapter_id) as total_likes")
      .group("chapter_id")
      .order('total_likes desc')

    median_likes = likes[likes.length/2].total_likes 
    
    chapter_ids_with_above_median_likes = likes
      .having('count(chapter_id) >= ?', median_likes)
      .map(&:chapter_id)

    @chapters = Chapter.where(
      "chapters.id in (?)", chapter_ids_with_above_median_likes
    ).order('updated_at DESC')  

    set_chapters_for_current_page!
  end

  def add
    @chapter = Chapter.new
  end

  def create
    chap = Chapter.new(
      manga:     params[:chapter][:manga], 
      number:    params[:chapter][:number],
      image_url: params[:chapter][:image_url] || '',
      #user_id: current_user.id
    )

    if chap.save
      flash[:notice] = "chapter added correctly"
      redirect_to root_path
    else
      flash[:error] = "something went wrong while adding chapter ( "
      flash[:error] << "manga "  if params[:chapter][:manga].blank?
      flash[:error] << "number " if params[:chapter][:number].blank?
      flash[:error] << ")"
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
    @chapter = Chapter.find(params[:id])
    @dashboard = get_dashboard(@chapter.manga)
  end
end
