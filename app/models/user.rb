class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  EMAIL_REGEXP = /\A[\w+-.]+@[a-z\d\-.]+\.[a-z]+\z/
  validates :email, presence: true, format: { with: EMAIL_REGEXP }, 
                    uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 6}

  has_many :likes

  def authenticate(password)
    self if password == self.password
  end

  def has_like(chap)
    Like.find_by(user_id: self.id, chapter_id: chap.id)
  end

  def like(chapter_id)
    Like.create(user_id: self.id, chapter_id: chapter_id)
  end
end

class Guest < User
  def id
    0
  end

  def like(chapter_id)
    false
  end
end
