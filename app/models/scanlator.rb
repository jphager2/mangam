class Scanlator < ActiveRecord::Base

  has_many :scanned_bies
  has_many :dashboards, through: :scanned_bies

  default_scope { order(:name) }

  def self.find_and_update_or_create(array_or_attributes)
    if array_or_attributes.respond_to?(:to_ary)
      array_or_attributes.map { |attributes| 
        find_and_update_or_create(attributes)
      }
    else
      name = HashWithIndifferentAccess.new(array_or_attributes)[:name]
      if found = find_by(name: name) 
        found.update(array_or_attributes)
        found
      else
        create(array_or_attributes) 
      end
    end
  end
end
