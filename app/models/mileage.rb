class Mileage < ActiveRecord::Base
  translates :name

  # == Validations
  validates_presence_of :unit, :name
  validates_uniqueness_of :unit, :name
end
