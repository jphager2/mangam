class Tag < ActiveRecord::Base

  has_many :chapter_tag_maps
  has_many :user_tag_maps
  has_many :chapters, through: :chapter_tag_maps
  has_many :users,    through: :user_tag_maps
end
