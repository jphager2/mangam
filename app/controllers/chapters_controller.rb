class ChaptersController < ApplicationController
  def index
    @chapters = Chapter.all
  end

  def add
  end

  def create
    Chapter.create(
      manga: params[:manga], 
      number: params[:number],
      #user_id: current_user.id
    )
    redirect_to root_path
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
