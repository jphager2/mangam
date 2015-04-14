class AddDashboardIdToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :dashboard_id, :integer
  end
end
