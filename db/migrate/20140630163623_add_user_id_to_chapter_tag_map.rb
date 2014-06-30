class AddUserIdToChapterTagMap < ActiveRecord::Migration
  def change

    add_column :chapter_tag_maps, :user_id, :integer

    ChapterTagMap.update_all("user_id = 0")
  end
end
