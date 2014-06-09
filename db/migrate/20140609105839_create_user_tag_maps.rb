class CreateUserTagMaps < ActiveRecord::Migration
  def change
    create_table :user_tag_maps do |t|
      t.integer :tag_id
      t.integer :chapter_id

      t.timestamps
    end
  end
end
