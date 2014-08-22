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

  class NullDashboard < Hash
    def initialize
      self[:genres]      = []
      self[:description] = "Looks like we can't find this manga"
      self[:scanlators]  = []
    end
  end 
end
