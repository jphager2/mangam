class Chapter < ActiveRecord::Base
  has_many :likes
  has_many :chapter_tag_maps
  has_many :tags, through: :chapter_tag_maps

  validates :manga, :number, presence: true

  before_save { self.number = Integer(number) }

  def title
    "#{self.manga} #{self.number}"
  end
end
