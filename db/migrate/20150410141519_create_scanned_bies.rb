class CreateScannedBies < ActiveRecord::Migration
  def change
    create_table :scanned_bies do |t|
      t.integer :scanlator_id
      t.integer :dashboard_id

      t.timestamps
    end
  end
end
