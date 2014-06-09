class RemoveColumnsFromTags < ActiveRecord::Migration
  def change
    remove_column :tags, :user_id
    remove_column :tags, :chapter_id
  end
end
