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

  describe "amount_per_day" do
    it "returns nil for zero refueling" do
      @car.amount_per_day.should be_nil
    end

    it "returns nil for one refueling" do
      first = Factory(:refueling, :car => @car, :date => 10.days.ago)

      @car.amount_per_day.should be_nil
    end

    it "returns amount per day by dividing total amount by total days" do
      first = Factory(:refueling, :car => @car, :mileage => 100, :liter => 50, :amount => 100.5, :date => 10.days.ago)
      second = Factory(:refueling, :car => @car, :mileage => 500, :liter => 40, :amount => 80.3, :date => 9.days.ago)
      third = Factory(:refueling, :car => @car, :mileage => 900, :liter => 35.6, :amount => 80.28, :date => 1.day.ago)

      @car.amount_per_day.should eql(17.84)
    end
  end

  describe "mileage_per_day" do
    it "returns nil for zero refueling" do
      @car.mileage_per_day.should be_nil
    end

    it "returns nil for one refueling" do
      first = Factory(:refueling, :car => @car, :date => 10.days.ago)

      @car.mileage_per_day.should be_nil
    end

    it "returns mileage per day by dividing total mileage by total days" do
      first = Factory(:refueling, :car => @car, :mileage => 100, :liter => 50, :amount => 100.5, :date => 10.days.ago)
      second = Factory(:refueling, :car => @car, :mileage => 500, :liter => 40, :amount => 80.3, :date => 9.days.ago)
      third = Factory(:refueling, :car => @car, :mileage => 900, :liter => 35.6, :amount => 80.28, :date => 1.day.ago)

      @car.mileage_per_day.should eql(88.89)
    end
  end

  describe "liter_per_day" do
    it "returns nil for zero refueling" do
      @car.liter_per_day.should be_nil
    end

    it "returns nil for one refueling" do
      first = Factory(:refueling, :car => @car, :date => 10.days.ago)

      @car.liter_per_day.should be_nil
    end

    it "returns liter per day by dividing total liters by total days" do
      first = Factory(:refueling, :car => @car, :mileage => 100, :liter => 50, :amount => 100.5, :date => 10.days.ago)
      second = Factory(:refueling, :car => @car, :mileage => 500, :liter => 40, :amount => 80.3, :date => 9.days.ago)
      third = Factory(:refueling, :car => @car, :mileage => 900, :liter => 35.6, :amount => 80.28, :date => 1.day.ago)

      @car.liter_per_day.should eql(8.4)
    end
  end

  describe "amount_per_year" do
    it "returns nil for zero refueling" do
      @car.amount_per_year.should be_nil
    end

    it "returns nil for one refueling" do
      first = Factory(:refueling, :car => @car, :date => 10.days.ago)

      @car.amount_per_year.should be_nil
    end

    it "returns amount per year by multiplying amount per day by 365" do
      first = Factory(:refueling, :car => @car, :mileage => 100, :liter => 50, :amount => 100.5, :date => 10.days.ago)
      second = Factory(:refueling, :car => @car, :mileage => 500, :liter => 40, :amount => 80.3, :date => 9.days.ago)
      third = Factory(:refueling, :car => @car, :mileage => 900, :liter => 35.6, :amount => 80.28, :date => 1.day.ago)

      @car.amount_per_year.should eql(6511.6)
    end
  end

  describe "mileage_per_year" do
    it "returns nil for zero refueling" do
      @car.mileage_per_year.should be_nil
    end

    it "returns nil for one refueling" do
      first = Factory(:refueling, :car => @car, :date => 10.days.ago)

      @car.mileage_per_year.should be_nil
    end

    it "returns mileage per year by multiplying mileage per day by 365" do
      first = Factory(:refueling, :car => @car, :mileage => 100, :liter => 50, :amount => 100.5, :date => 10.days.ago)
      second = Factory(:refueling, :car => @car, :mileage => 500, :liter => 40, :amount => 80.3, :date => 9.days.ago)
      third = Factory(:refueling, :car => @car, :mileage => 900, :liter => 35.6, :amount => 80.28, :date => 1.day.ago)

      @car.mileage_per_year.should eql(32444.85)
    end
  end

  describe "liter_per_year" do
    it "returns nil for zero refueling" do
      @car.liter_per_year.should be_nil
    end

    it "returns nil for one refueling" do
      first = Factory(:refueling, :car => @car, :date => 10.days.ago)

      @car.liter_per_year.should be_nil
    end

    it "returns liter per year by multiplying liter per day by 365" do
      first = Factory(:refueling, :car => @car, :mileage => 100, :liter => 50, :amount => 100.5, :date => 10.days.ago)
      second = Factory(:refueling, :car => @car, :mileage => 500, :liter => 40, :amount => 80.3, :date => 9.days.ago)
      third = Factory(:refueling, :car => @car, :mileage => 900, :liter => 35.6, :amount => 80.28, :date => 1.day.ago)

      @car.liter_per_year.should eql(3066)
    end
  end

  describe "amount_per_month" do
    it "returns nil for zero refueling" do
      @car.amount_per_month.should be_nil
    end

    it "returns nil for one refueling" do
      first = Factory(:refueling, :car => @car, :date => 10.days.ago)

      @car.amount_per_month.should be_nil
    end

    it "returns amount per month by dividing amount per year by 12" do
      first = Factory(:refueling, :car => @car, :mileage => 100, :liter => 50, :amount => 100.5, :date => 10.days.ago)
      second = Factory(:refueling, :car => @car, :mileage => 500, :liter => 40, :amount => 80.3, :date => 9.days.ago)
      third = Factory(:refueling, :car => @car, :mileage => 900, :liter => 35.6, :amount => 80.28, :date => 1.day.ago)

      @car.amount_per_month.should eql(542.63)
    end
  end

  describe "mileage_per_month" do
    it "returns nil for zero refueling" do
      @car.mileage_per_month.should be_nil
    end

    it "returns nil for one refueling" do
      first = Factory(:refueling, :car => @car, :date => 10.days.ago)

      @car.mileage_per_month.should be_nil
    end

    it "returns mileage per month by dividing mileage per year by 12" do
      first = Factory(:refueling, :car => @car, :mileage => 100, :liter => 50, :amount => 100.5, :date => 10.days.ago)
      second = Factory(:refueling, :car => @car, :mileage => 500, :liter => 40, :amount => 80.3, :date => 9.days.ago)
      third = Factory(:refueling, :car => @car, :mileage => 900, :liter => 35.6, :amount => 80.28, :date => 1.day.ago)

      @car.mileage_per_month.should eql(2703.74)
    end
  end

  describe "liter_per_month" do
    it "returns nil for zero refueling" do
      @car.liter_per_month.should be_nil
    end

    it "returns nil for one refueling" do
      first = Factory(:refueling, :car => @car, :date => 10.days.ago)

      @car.liter_per_month.should be_nil
    end

    it "returns liter per month by dividing liter per year by 12" do
      first = Factory(:refueling, :car => @car, :mileage => 100, :liter => 50, :amount => 100.5, :date => 10.days.ago)
      second = Factory(:refueling, :car => @car, :mileage => 500, :liter => 40, :amount => 80.3, :date => 9.days.ago)
      third = Factory(:refueling, :car => @car, :mileage => 900, :liter => 35.6, :amount => 80.28, :date => 1.day.ago)

      @car.liter_per_month.should eql(255.5)
    end
  end

end
