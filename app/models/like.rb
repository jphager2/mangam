class Like < ActiveRecord::Base
  validates :chapter_id, presence: true
  validates :user_id,    presence: true
  validates :chapter_id, uniqueness: {scope: :user_id}
end
