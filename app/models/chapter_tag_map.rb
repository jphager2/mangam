class ChapterTagMap < ActiveRecord::Base
  belongs_to :chapter
  belongs_to :tag
end
