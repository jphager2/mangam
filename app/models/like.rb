class Like < ActiveRecord::Base
  validates :chapter_id, presence: true
  validates :user_id,    presence: true
  validates :chapter_id, uniqueness: {scope: :user_id}

  belongs_to :chapter
  belongs_to :user

  def self.popular_chapter_ids
    chapter_likes = ordered_chapter_totals
    median_like   = chapter_likes[chapter_likes.length/2]

    return [] unless median_like

    min_pop_likes = median_like.total_likes
    
    chapter_likes.having('count(chapter_id) >= ?', min_pop_likes)
      .map(&:chapter_id) 
  end

  def self.ordered_chapter_totals
    return [] if Like.count.zero?
    Like
      .select("chapter_id, count(chapter_id) as total_likes")
      .group("chapter_id")
      .order('total_likes desc')
  end
end
