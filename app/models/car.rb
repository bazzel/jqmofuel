class Car < ActiveRecord::Base
  validates_presence_of :brand

  # has_many :refuelings
  #
  # def amount_per_day
  #   if refuelings.size > 1
  #     (refuelings.sum(:amount) / number_of_days)
  #   end
  # end
  #
  # def amount_per_year
  #   if amount_per_day
  #     amount_per_day * 365
  #   end
  # end
  #
  # def amount_per_month
  #   if amount_per_year
  #     amount_per_year / 12
  #   end
  # end
  #
  # def liter_per_day
  #   if refuelings.size > 1
  #     (refuelings.sum(:liter) / number_of_days)
  #   end
  # end
  #
  # def liter_per_year
  #   if liter_per_day
  #     liter_per_day * 365
  #   end
  # end
  #
  # def liter_per_month
  #   if liter_per_year
  #     liter_per_year / 12
  #   end
  # end
  #
  # def number_of_days
  #   (refuelings.maximum(:date).to_date - refuelings.minimum(:date).to_date)
  # end
  #
  # def fuel_consumption
  #   if refuelings.size > 1
  #     total_mileage / total_fuel
  #   end
  # end
  #
  # def total_mileage
  #   (refuelings.maximum(:mileage) - refuelings.minimum(:mileage))
  # end
  #
  # def total_fuel
  #   refuelings.sum(:liter)
  # end
end
