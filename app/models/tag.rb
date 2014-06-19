class Tag < ActiveRecord::Base
  before_save {self.name = Tag.tagify(self.name)}

  validates :name, presence: true, 
    uniqueness: { case_sensitive: false }

  has_many :chapter_tag_maps
  has_many :user_tag_maps
  has_many :chapters, through: :chapter_tag_maps
  has_many :users,    through: :user_tag_maps

  def to_s
    "##{self.name}"
  end

  def self.tagify(name)
    name.gsub( /\s/, '_' ).gsub( /#+/, '') 
  end
end
