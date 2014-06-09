class Chapter < ActiveRecord::Base
  before_save { self.number = Integer(number) }

  has_many :likes
  has_many :chapter_tag_maps
  has_many :tags, through: :chapter_tag_maps
end
