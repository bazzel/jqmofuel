class Refueling < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  extend ActiveSupport::Memoizable

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

  def description
    "#{self.class} ##{id}"
  end

  # Returns the previous refueling
  # or nil if <tt>self</tt> is the first refueling in time.
  def predecessor
    car.refuelings.order(:date).where("date < ?", date).last
  end
  memoize :predecessor

  # Returns kilometres per litre.
  def fuel_efficiency
    ((mileage - predecessor.mileage) / liter).round(1) if predecessor
  end
  memoize :fuel_efficiency

  def fuel_consumption
    (liter / (mileage - predecessor.mileage)*100).round(1) if predecessor
  end
  memoize :fuel_consumption

  # Return the fuel efficiency based on all refuelings up til the current one.
  def moving_fuel_efficiency
    if predecessor
      logger.debug("[#{self.class}.moving_fuel_efficiency] Calculating for #{description}: #{running_total_mileage} / #{running_total_liter} = #{(running_total_mileage.to_f / running_total_liter).round(1)}")
      (running_total_mileage.to_f / running_total_liter).round(1)
    end
  end
  memoize :moving_fuel_efficiency

  def moving_fuel_consumption
    if predecessor
      logger.debug("[#{self.class}.moving_fuel_consumption] Calculating for #{description}: #{running_total_liter} / #{running_total_mileage} * 100 = #{(running_total_liter / running_total_mileage.to_f * 100 ).round(1)}")
      (running_total_liter / running_total_mileage.to_f * 100 ).round(1)
    end
  end
  memoize :moving_fuel_consumption

  class << self
    # Returns a hash
    # where each key is a date marking the beginning of a month
    # and where it's value is an array of refuelings of that month.
    def grouped_by_month
      order('date DESC').group_by { |r| r.date.beginning_of_month }
    end
  end

  private
    def running_refuelings
      car.refuelings.order(:date).where("date <= ?", date)
    end
    memoize :running_refuelings

    def first_refueling
      running_refuelings.first
    end
    memoize :first_refueling

    def running_total_mileage
      mileage - first_refueling.mileage
    end
    memoize :running_total_mileage

    def running_total_liter
      running_refuelings.sum(:liter) - first_refueling.liter
    end
    memoize :running_total_liter
end