class Refueling < ActiveRecord::Base
  validates_presence_of :date

  validates_numericality_of :liter_units, :only_integer => true, :greater_than_or_equal_to => 0
  validates_numericality_of :liter_cents, :only_integer => true, :greater_than_or_equal_to => 0, :less_than => 100
  validates_numericality_of :liter, :greater_than => 0

  validates_numericality_of :amount_units, :only_integer => true, :greater_than_or_equal_to => 0
  validates_numericality_of :amount_cents, :only_integer => true, :greater_than_or_equal_to => 0, :less_than => 100
  validates_numericality_of :amount, :greater_than => 0

  belongs_to :car

  attr_accessor :amount_units
  attr_accessor :amount_cents

  attr_accessor :liter_units
  attr_accessor :liter_cents

  before_validation :set_amount_based_on_units_and_cents
  before_validation :set_liter_based_on_units_and_cents

  def amount_units
    if amount
      amount.to_i
    end
  end

  def amount_cents
    if amount
      (amount - amount.to_i) * 100
    end
  end

  def liter_units
    if liter
      liter.to_i
    end
  end

  def liter_cents
    if liter
      (liter - liter.to_i) * 100
    end
  end

  private
    def set_amount_based_on_units_and_cents
      u = @amount_units
      c = @amount_cents

      if u && c
        self.amount = BigDecimal("#{u[0,2]}.#{c[0,2]}")
      end
    end

    def set_liter_based_on_units_and_cents
      u = @liter_units
      c = @liter_cents

      if u && c
        self.liter = BigDecimal("#{u[0,2]}.#{c[0,2]}")
      end
    end


end
