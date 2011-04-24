class Volume < ActiveRecord::Base
  translates :unit, :name

  # == Validations
  validates_presence_of :unit, :name
  validates_uniqueness_of :unit, :name
end
