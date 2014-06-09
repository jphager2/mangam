class ReplaceColumnInUserTagMap < ActiveRecord::Migration
  def change
    remove_column :user_tag_maps, :chapter_id
    add_column    :user_tag_maps, :user_id, :integer
  end
end
