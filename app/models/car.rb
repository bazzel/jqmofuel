class Car < ActiveRecord::Base
  # == Validations
  validates_presence_of :brand

  # == Associations
  has_many :refuelings

  def last_refueling
    @last_refueling ||= refuelings.order(:date).last
  end

  def fuel_consumption
    if more_than_one_refuelings?
      @fuel_consumption ||= ("%.1f" % (total_mileage / total_liter))
    end
  end

  def total_mileage
    if more_than_one_refuelings?
      @total_mileage ||= (last_refueling.mileage - first_refueling.mileage)
    end
  end

  def total_liter
    if more_than_one_refuelings?
      @total_liter ||= refuelings.sum(:liter) - first_refueling.liter
    end
  end

  def total_amount
    if more_than_one_refuelings?
      @total_amount ||= refuelings.sum(:amount) - first_refueling.amount
    end
  end

  private
    def first_refueling
      @first_refueling ||= refuelings.order(:date).first
    end

    def more_than_one_refuelings?
      @more_than_one_refuelings ||= (refuelings.size > 1)
    end
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
end
