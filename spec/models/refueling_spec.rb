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

  describe "predecessor" do
    before(:each) do
      @predecessor = Factory(:refueling, :date => Date.parse('31-12-2004'), :liter => 20.5, :amount => 35.75)
      @refueling = Factory(:refueling, :date => Date.parse('13-1-2005'), :liter => 20.5, :amount => 35.75, :car => @predecessor.car)
    end

    it "returns nil for 1st refueling" do
      @predecessor.predecessor.should be_nil
    end

    it "returns previous refueling" do
      @refueling.predecessor.should eql(@predecessor)
    end
  end

  describe "fuel_consumption" do
    before(:each) do
      @predecessor = Factory(:refueling, :date => Date.parse('31-12-2004'), :liter => 20.5, :mileage => 100)
      @refueling = Factory(:refueling, :date => Date.parse('13-1-2005'), :liter => 20.5, :mileage => 500, :car => @predecessor.car)
    end

    it "returns nil for 1st refueling" do
      @predecessor.fuel_consumption.should be_nil
    end

    it "diff. in mileage with predecessor divided by liters" do
      @refueling.fuel_consumption.should eql(19.5)
    end
  end

  describe "moving_fuel_consumption" do
    before(:each) do
      @first = Factory(:refueling, :date => Date.parse('1-1-2011'), :liter => 50, :mileage => 100)
      @second = Factory(:refueling, :date => Date.parse('1-2-2011'), :liter => 50, :mileage => 1100, :car => @first.car)
      @third = Factory(:refueling, :date => Date.parse('1-3-2011'), :liter => 25, :mileage => 1350, :car => @first.car)
    end

    it "returns nil for 1st refueling" do
      @first.moving_fuel_consumption.should be_nil
    end

    it "returns fuel_consumption for second refueling" do
      @second.fuel_consumption.should eql(20.0)
      @second.moving_fuel_consumption.should eql(20.0)
    end

    it "returns fuel_consumption up to current refueling" do
      @third.fuel_consumption.should eql(10.0)
      @third.moving_fuel_consumption.should eql(16.7)
    end
  end
end
