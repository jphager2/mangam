class ChapterTagMap < ActiveRecord::Base
  belongs_to :chapter
  belongs_to :tag

  validates :tag_id, :chapter_id, presence: true
end
