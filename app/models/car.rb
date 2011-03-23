class Car < ActiveRecord::Base
  extend ActiveSupport::Memoizable

  # == Validations
  validates_presence_of :brand

  # == Associations
  has_many :refuelings

  def to_s
    [brand_was, car_model_was].join(" ").rstrip
  end

  def last_refueling
    refuelings.order(:date).last
  end
  memoize :last_refueling

  def fuel_efficiency
    last_refueling.moving_fuel_efficiency if more_than_one_refuelings?
  end
  memoize :fuel_efficiency

  def fuel_consumption
    last_refueling.moving_fuel_consumption if more_than_one_refuelings?
  end
  memoize :fuel_consumption

  def total_mileage
    (last_refueling.mileage - first_refueling.mileage) if more_than_one_refuelings?
  end
  memoize :total_mileage

  def total_liter
    (refuelings.sum(:liter) - first_refueling.liter) if more_than_one_refuelings?
  end
  memoize :total_liter

  def total_amount
    refuelings.sum(:amount) - first_refueling.amount if more_than_one_refuelings?
  end
  memoize :total_amount

  def amount_per_day
    (total_amount / number_of_days).round(2) if more_than_one_refuelings?
  end
  memoize :amount_per_day

  def mileage_per_day
    (total_mileage.to_f / number_of_days).round(2) if more_than_one_refuelings?
  end
  memoize :mileage_per_day

  def liter_per_day
    (total_liter / number_of_days).round(2) if more_than_one_refuelings?
  end
  memoize :liter_per_day

  def amount_per_year
    (amount_per_day * 365) if amount_per_day
  end
  memoize :amount_per_year

  def mileage_per_year
    (mileage_per_day * 365) if mileage_per_day
  end
  memoize :mileage_per_year

  def liter_per_year
    (liter_per_day * 365) if liter_per_day
  end
  memoize :liter_per_year

  def amount_per_month
    (amount_per_year / 12).round(2) if amount_per_year
  end
  memoize :amount_per_month

  def mileage_per_month
    (mileage_per_year / 12).round(2) if mileage_per_year
  end
  memoize :mileage_per_month

  def liter_per_month
    (liter_per_year / 12).round(2) if liter_per_year
  end
  memoize :liter_per_month

  def first_refueling
    refuelings.order(:date).first
  end
  memoize :first_refueling

  def more_than_one_refuelings?
    (refuelings.size > 1)
  end
  memoize :more_than_one_refuelings?

  def relevant_refuelings
    if more_than_one_refuelings?
      relevant_refuelings = refuelings.order(:date)
      relevant_refuelings.delete_at(0)
      relevant_refuelings
    else
      []
    end
  end
  memoize :relevant_refuelings

  private
    def number_of_days
      (last_refueling.date - first_refueling.date)
    end
    memoize :number_of_days
end
