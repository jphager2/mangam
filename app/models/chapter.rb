class Chapter < ActiveRecord::Base
  before_save { self.number = Integer(number) }
end
