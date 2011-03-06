require 'spec_helper'

describe Car do
  before(:each) do
    @car = Factory(:car)
  end

  it { should validate_presence_of(:brand) }
  it { should have_many(:refuelings) }

  describe "last_fueling" do
    it "returns nil if refuelings are empty" do
      @car.last_refueling.should be_nil
    end

    it "returns last refueling" do
      first = Factory(:refueling, :car => @car, :date => 10.days.ago)
      last = Factory(:refueling, :car => @car, :date => 1.day.ago)
      @car.last_refueling.should eql(last)
    end
  end

  describe "fuel_consumption" do
    it "returns nil for zero refueling" do
      @car.fuel_consumption.should be_nil
    end

    it "returns nil for one refueling" do
      first = Factory(:refueling, :car => @car, :date => 10.days.ago)

      @car.fuel_consumption.should be_nil
    end

    it "returns numbers of kilometers per liter of last refueling" do
      first = Factory(:refueling, :car => @car, :mileage => 100, :liter => 50, :amount => 100, :date => 10.days.ago)
      second = Factory(:refueling, :car => @car, :mileage => 500, :liter => 40, :amount => 80, :date => 1.day.ago)

      @car.fuel_consumption.should eql("10.0")
    end

    it "returns fuel_consumption with 1 decimal" do
      first = Factory(:refueling, :car => @car, :mileage => 100, :liter => 50, :amount => 100, :date => 10.days.ago)
      second = Factory(:refueling, :car => @car, :mileage => 600, :liter => 42, :amount => 80, :date => 1.day.ago)

      @car.fuel_consumption.should eql("11.9")
    end
  end

  describe "total_mileage" do
    it "returns nil for zero refueling" do
      @car.total_mileage.should be_nil
    end

    it "returns nil for one refueling" do
      first = Factory(:refueling, :car => @car, :date => 10.days.ago)

      @car.total_mileage.should be_nil
    end

    it "returns total mileage as div. between last and second refuelings" do
      first = Factory(:refueling, :car => @car, :mileage => 100, :liter => 50, :amount => 100, :date => 10.days.ago)
      second = Factory(:refueling, :car => @car, :mileage => 500, :liter => 40, :amount => 80, :date => 1.day.ago)

      @car.total_mileage.should eql(400)
    end
  end

  describe "total_liter" do
    it "returns nil for zero refueling" do
      @car.total_liter.should be_nil
    end

    it "returns nil for one refueling" do
      first = Factory(:refueling, :car => @car, :date => 10.days.ago)

      @car.total_liter.should be_nil
    end

    it "returns total liters as sum of all liters except minus the first refueling" do
      first = Factory(:refueling, :car => @car, :mileage => 100, :liter => 50, :amount => 100, :date => 10.days.ago)
      second = Factory(:refueling, :car => @car, :mileage => 500, :liter => 40, :amount => 80, :date => 2.days.ago)
      third = Factory(:refueling, :car => @car, :mileage => 900, :liter => 35.6, :amount => 80, :date => 1.day.ago)

      @car.total_liter.should eql(75.6)
    end
  end

  describe "total_amount" do
    it "returns nil for zero refueling" do
      @car.total_amount.should be_nil
    end

    it "returns nil for one refueling" do
      first = Factory(:refueling, :car => @car, :date => 10.days.ago)

      @car.total_amount.should be_nil
    end

    it "returns total amount as sum of all amounts except minus the first refueling" do
      first = Factory(:refueling, :car => @car, :mileage => 100, :liter => 50, :amount => 100.5, :date => 10.days.ago)
      second = Factory(:refueling, :car => @car, :mileage => 500, :liter => 40, :amount => 80.3, :date => 2.days.ago)
      third = Factory(:refueling, :car => @car, :mileage => 900, :liter => 35.6, :amount => 80.28, :date => 1.day.ago)

      @car.total_amount.should eql(160.58)
    end
  end


end
