class Tag < ActiveRecord::Base
  before_save {self.name = name.gsub(/\s/, '_')}
  before_save {self.name = name.gsub(/#+/, '')}

  validates :name, presence: true, 
    uniqueness: { case_sensitive: false }

  has_many :chapter_tag_maps
  has_many :user_tag_maps
  has_many :chapters, through: :chapter_tag_maps
  has_many :users,    through: :user_tag_maps

  def to_s
    "##{self.name}"
  end
end
