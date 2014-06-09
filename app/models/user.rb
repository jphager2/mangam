class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  EMAIL_REGEXP = /\A[\w+-.]+@[a-z\d\-.]+\.[a-z]+\z/
  validates :email, presence: true, format: { with: EMAIL_REGEXP }, 
                    uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 6}

  def authenticate(password)
    self if password == self.password
  end
end
