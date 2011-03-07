class ConvertRefuelingDateToDate < ActiveRecord::Migration
  def self.up
    change_column(:refuelings, :date, :date)
  end

  def self.down
    change_column(:refuelings, :date, :datetime)
  end
end
