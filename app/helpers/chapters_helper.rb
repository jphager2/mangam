module ChaptersHelper

  def set_current_page!
    @page = params[:page] || 1
    @page = Integer(@page)
  end

  def set_chapters_for_current_page!
    @chapters = @chapters[(50*(@page-1))..(50*@page-1)] || []
  end
end
