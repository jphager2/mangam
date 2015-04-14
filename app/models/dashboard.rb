class Dashboard < ActiveRecord::Base

  has_many :scanned_bies
  has_many :scanlators, through: :scanned_bies

  def current?
    updated_at > 1.day.ago
  end
end
