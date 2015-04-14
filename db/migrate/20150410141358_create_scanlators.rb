class CreateScanlators < ActiveRecord::Migration
  def change
    create_table :scanlators do |t|
      t.string :url
      t.string :name

      t.timestamps
    end
  end
end
