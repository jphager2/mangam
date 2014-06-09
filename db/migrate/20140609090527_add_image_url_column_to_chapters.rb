class AddImageUrlColumnToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :image_url, :string
  end
end
