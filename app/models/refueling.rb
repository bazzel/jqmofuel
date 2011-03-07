class Refueling < ActiveRecord::Base
  # == Validations
  validates_presence_of :mileage
  validates_presence_of :date
  validates_presence_of :liter
  validates_presence_of :amount
  validates_presence_of :car
  validates_numericality_of :liter, :greater_than => 0
  validates_numericality_of :amount, :greater_than => 0
  validates_numericality_of :mileage, :greater_than => 0

  belongs_to :car

end
