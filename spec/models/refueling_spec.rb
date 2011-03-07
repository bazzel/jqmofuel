require 'spec_helper'

describe Refueling do
  it { should validate_presence_of(:mileage) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:liter) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:car) }

  it { should validate_numericality_of(:liter, :greater_than => 0)}
  it { should validate_numericality_of(:amount, :greater_than => 0)}
  it { should validate_numericality_of(:mileage, :greater_than => 0)}
end
