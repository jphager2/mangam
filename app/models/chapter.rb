class Chapter < ActiveRecord::Base
  before_save { self.number = Integer(number) }

  has_many :likes
end
