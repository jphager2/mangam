module ChaptersHelper

  def like_to(chapter, text = nil)
    if like = current_or_guest_user.has_like(chapter) 
      text ||= t('unlike.verb')
      options = { method: :delete, remote: true }
      if block_given?
        link_to(unlike_path(like, format: :js), options) do
          yield(text, :unlike)
        end
      else
        link_to(text, unlike_path(like, format: :js), options)
      end
    else
      text ||= t('like.verb')
      options = { method: :post, remote: true }
      if block_given?
        link_to(like_path(chapter), options) { yield(text, :like) }
      else
        link_to(text, like_path(chapter), options)
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
    timeout(8) do
      BU::Api.new.dashboard(manga)
    end
  rescue Object 
    NullDashboard.new
  end

  class NullDashboard 
    attr_reader :genres, :description, :scanlators, :title, :url
    def initialize
      @url         = ""
      @title       = ""
      @genres      = []
      @description = "Looks like we can't find this manga"
      @scanlators  = []
    end
  end 
end
