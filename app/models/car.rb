class Car < ActiveRecord::Base
  # == Validations
  validates_presence_of :brand

  # == Associations
  has_many :refuelings

  def to_s
    [brand_was, car_model_was].join(" ").rstrip
  end

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

  def amount_per_day
    if more_than_one_refuelings?
      @amount_per_day ||= (total_amount / number_of_days).round(2)
    end
  end

  def mileage_per_day
    if more_than_one_refuelings?
      @mileage_per_day ||= (total_mileage.to_f / number_of_days).round(2)
    end
  end

  def liter_per_day
    if more_than_one_refuelings?
      @liter_per_day ||= (total_liter / number_of_days).round(2)
    end
  end

  def amount_per_year
    if amount_per_day
      @amount_per_year ||= (amount_per_day * 365)
    end
  end

  def mileage_per_year
    if mileage_per_day
      @mileage_per_year ||= mileage_per_day * 365
    end
  end

  def liter_per_year
    if liter_per_day
      @liter_per_year ||= (liter_per_day * 365)
    end
  end

  def amount_per_month
    if amount_per_year
      @amount_per_month ||= (amount_per_year / 12).round(2)
    end
  end

  def mileage_per_month
    if mileage_per_year
      @mileage_per_month ||= (mileage_per_year / 12).round(2)
    end
  end

  def liter_per_month
    if liter_per_year
      @liter_per_month ||= (liter_per_year / 12).round(2)
    end
  end

  def first_refueling
    @first_refueling ||= refuelings.order(:date).first
  end

  def more_than_one_refuelings?
    @more_than_one_refuelings ||= (refuelings.size > 1)
  end

  private
    def number_of_days
      @number_of_days ||= (last_refueling.date - first_refueling.date)
    end
end
