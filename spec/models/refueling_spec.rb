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

  describe "to_s" do
    it "returns liters and amount" do
      refueling = Factory(:refueling, :date => Date.parse('31-12-2004'), :liter => 20.5, :amount => 35.75)
      refueling.to_s.should eql("20.5 L - $35.75")
    end
  end
end
