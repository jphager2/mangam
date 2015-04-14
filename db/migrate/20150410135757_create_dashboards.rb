class CreateDashboards < ActiveRecord::Migration
  def change
    create_table :dashboards do |t|
      t.string :url, default: ''
      t.string :title, default: ''
      t.text :genres, array: true, default: []
      t.text :description, default: ''

      t.timestamps
    end
  end
end
