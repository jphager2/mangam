class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # My Code Below This Line
  before_save { self.email = email.downcase }

  has_many :likes
  has_many :user_tag_maps
  has_many :tags, through: :user_tag_maps

  def authenticate(password)
    self if password == self.password
  end

  def has_like(chap)
    Like.find_by(user_id: self.id, chapter_id: chap.id)
  end

  def like(chapter_id)
    Like.create(user_id: self.id, chapter_id: chapter_id)
  end

  def tag(name)
    Tag.create(name: name)
  end
end

class Guest < User
  def id
    0
  end

  def like(chapter_id)
    false
  end

  def tag(name)
    nil
  end
end
