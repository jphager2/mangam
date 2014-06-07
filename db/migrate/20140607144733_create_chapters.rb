class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :manga
      t.integer :number

      t.timestamps
    end
  end
end
