class ChaptersController < ApplicationController
  def index
    @page = params[:page] || 1
    @page = Integer(@page)
    @chapters = Chapter.order('updated_at DESC')
    @chapters = @chapters[(50*(@page-1))..(50*@page-1)]
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
