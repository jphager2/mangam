module ChaptersHelper

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
    attr_reader :genres, :description, :scanlators
    def initialize
      @genres      = []
      @description = "Looks like we can't find this manga"
      @scanlators  = []
    end
  end 
end
