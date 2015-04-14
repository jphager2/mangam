class ScannedBy < ActiveRecord::Base
  belongs_to :scanlator
  belongs_to :dashboard
end
