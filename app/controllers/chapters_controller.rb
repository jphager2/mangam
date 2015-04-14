class ChaptersController < ApplicationController

  before_action :authenticate_user!, except: [:index, :popular, :show]

  def index
    set_current_page!
    @chapters = Chapter.order('updated_at DESC')
    set_chapters_for_current_page!
  end

  def popular
    set_current_page!
    @chapters = Chapter.where(
      "chapters.id in (?)", Like.popular_chapter_ids
    ).order('updated_at DESC')  
    set_chapters_for_current_page!

    render :index
  end

  def new 
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

  def show 
    @chapter = Chapter.find(params[:id])
    @dashboard = @chapter.dashboard

    unless @dashboard && @dashboard.current?
      @dashboard = get_dashboard(@chapter.manga)
      unless @dashboard.is_a? NullDashboard
        @dashboard = @chapter.set_dashboard_from_bu_api(@dashboard)
      end
    end
  end
end
