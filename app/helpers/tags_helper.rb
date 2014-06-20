module TagsHelper
  def set_current_page!
    @page = params[:page] || 1
    @page = Integer(@page)
  end

  def items_for_current_page(items)
    items[(50*(@page-1))..(50*@page-1)] || []
  end
end
