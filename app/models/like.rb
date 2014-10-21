class Like < ActiveRecord::Base
  validates :chapter_id, presence: true
  validates :user_id,    presence: true
  validates :chapter_id, uniqueness: {scope: :user_id}

  belongs_to :chapter
  belongs_to :user

  class MedianLikes
    def likes
      @likes ||= Like
        .select("chapter_id, count(chapter_id) as total_likes")
        .group("chapter_id")
        .order('total_likes desc')
    end

    def median
      return [] if likes.empty?
      @median ||= likes[likes.length/2].total_likes
    end
  end
end
