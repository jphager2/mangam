class UpdateAllTagNames < ActiveRecord::Migration
  def change
    Tag.update_all("name = LOWER(name)")
  end
end
