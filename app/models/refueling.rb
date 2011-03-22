class Refueling < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

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

  def to_s
    "#{number_with_delimiter(liter_was)} #{I18n.t('abbr.liter')} - #{number_to_currency(amount_was)}"
  end

  def predecessor
    car.refuelings.order(:date).where("date < ?", date).last
  end

  # Returns kilometres per litre.
  def fuel_efficiency
    if predecessor
      ((mileage - predecessor.mileage) / liter).round(1)
    end
  end

  # Return the fuel efficiency based on all refuelings up til the current one.
  def moving_fuel_efficiency
    if predecessor
      @moving_fuel_efficiency ||= begin
        running_refuelings = car.refuelings.order(:date).where("date <= ?", date)
        first_refueling = running_refuelings.first
        running_total_mileage = mileage - first_refueling.mileage
        running_total_liter = running_refuelings.sum(:liter) - first_refueling.liter
        moving_fuel_efficiency = (running_total_mileage.to_f / running_total_liter).round(1)
        logger.debug("[#{self.class}.moving_fuel_efficiency] Calculating for #{description}: #{running_total_mileage} / #{running_total_liter} = #{moving_fuel_efficiency}")
        @moving_fuel_efficiency = moving_fuel_efficiency
      end
    end
  end

  def description
    "#{self.class} ##{id}"
  end
end
