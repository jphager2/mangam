module ChaptersHelper

  def like_to(chapter, text = t('like.verb'))
    if current_user.has_like(chapter) 
      if block_given?
        link_to unlike_path(chapter), method: :delete do 
          yield
        end
      else
        link_to text, unlike_path, method: :delete
      end
    else
      if block_given?
        link_to like_path(chapter), method: :post do 
          yield
        end
      else
        link_to text, like_path, method: :post
      end
    end
  end

  def set_current_page!
    @page = params[:page] || 1
    @page = Integer(@page)
  end

  def set_chapters_for_current_page!
    @chapters = @chapters[(50*(@page-1))..(50*@page-1)] || []
  end

  def get_dashboard(manga)
    BU::Api.new.dashboard(manga)
  rescue Object 
    NullDashboard.new
  end

  class NullDashboard 
    attr_reader :genres, :description, :scanlators, :title
    def initialize
      @title       = ""
      @genres      = []
      @description = "Looks like we can't find this manga"
      @scanlators  = []
    end
  end 
end
