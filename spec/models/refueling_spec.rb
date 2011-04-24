require 'spec_helper'

describe Refueling do
  it { should validate_presence_of(:mileage) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:liter) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:car) }

  it { should validate_numericality_of(:liter, :greater_than => 0) }
  it { should validate_numericality_of(:amount, :greater_than => 0) }
  it { should validate_numericality_of(:mileage, :greater_than => 0) }

  it { should belong_to(:car) }
  it { should belong_to(:user) }

  describe "to_s" do
    before(:each) do
      @refueling = Factory(:refueling, :date => Date.parse('31-12-2004'), :liter => 20.5, :amount => 35.75)
    end
    it "returns liters and amount" do
      @current_user = mock_model(User, :volume => mock_model(Volume, :unit => 'L'))
      @refueling.stub(:user).and_return(@current_user)
      @refueling.to_s.should eql("20.5 L - $35.75")
    end

    it "returns volume in user's preference" do
      @current_user = mock_model(User, :volume => mock_model(Volume, :unit => 'gal'))
      @refueling.stub(:user).and_return(@current_user)

      @refueling.to_s.should eql("20.5 gal - $35.75")
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

  describe "fuel efficiency and consumption" do
    before(:each) do
      @predecessor = Factory(:refueling, :date => Date.parse('31-12-2004'), :liter => 20.5, :mileage => 100)
      @refueling = Factory(:refueling, :date => Date.parse('13-1-2005'), :liter => 20.5, :mileage => 500, :car => @predecessor.car)
    end

    describe "fuel_efficiency" do
      it "returns nil for 1st refueling" do
        @predecessor.fuel_efficiency.should be_nil
      end

      it "diff. in mileage with predecessor divided by liters" do
        @refueling.fuel_efficiency.should eql(19.5)
      end
    end

    describe "fuel_consumption" do
      it "returns nil for 1st refueling" do
        @predecessor.fuel_consumption.should be_nil
      end

      it "liters divided by diff. in mileage with predecessor times 100" do
        @refueling.fuel_consumption.should eql(5.1)
      end
    end

  end

  describe "moving fuel efficiency and consumption" do
    before(:each) do
      @first = Factory(:refueling, :date => Date.parse('1-1-2011'), :liter => 50, :mileage => 100)
      @second = Factory(:refueling, :date => Date.parse('1-2-2011'), :liter => 50, :mileage => 1100, :car => @first.car)
      @third = Factory(:refueling, :date => Date.parse('1-3-2011'), :liter => 25, :mileage => 1350, :car => @first.car)
    end

    describe "moving_fuel_efficiency" do
      it "returns nil for 1st refueling" do
        @first.moving_fuel_efficiency.should be_nil
      end

      it "returns fuel_efficiency for second refueling" do
        @second.fuel_efficiency.should eql(20.0)
        @second.moving_fuel_efficiency.should eql(20.0)
      end

      it "returns fuel_efficiency up to current refueling" do
        @third.fuel_efficiency.should eql(10.0)
        @third.moving_fuel_efficiency.should eql(16.7)
      end
    end

    describe "moving_fuel_consumption" do
      it "returns nil for 1st refueling" do
        @first.moving_fuel_consumption.should be_nil
      end

      it "returns fuel_consumption for second refueling" do
        @second.fuel_consumption.should eql(5.0)
        @second.moving_fuel_consumption.should eql(5.0)
      end

      it "returns fuel_consumption up to current refueling" do
        @third.fuel_consumption.should eql(10.0)
        @third.moving_fuel_consumption.should eql(6.0)
      end
    end
  end

  describe "fuel cost" do
    before(:each) do
      @predecessor = Factory(:refueling, :date => Date.parse('31-12-2004'), :liter => 20.5, :mileage => 100, :amount => 34.85)
      @refueling = Factory(:refueling, :date => Date.parse('13-1-2005'), :liter => 20.5, :mileage => 500, :amount => 34.85, :car => @predecessor.car)
    end

    it "returns nil for 1st refueling" do
      @predecessor.fuel_cost.should be_nil
    end

    it "diff. in mileage with predecessor divided by amount" do
      @refueling.fuel_cost.should eql(8.7) # cents
    end
  end

  describe "moving_fuel_cost" do
    before(:each) do
      @first = Factory(:refueling, :date => Date.parse('1-1-2011'), :liter => 50, :mileage => 100, :amount => 85.0)
      @second = Factory(:refueling, :date => Date.parse('1-2-2011'), :liter => 50, :mileage => 1100, :amount => 82.5, :car => @first.car)
      @third = Factory(:refueling, :date => Date.parse('1-3-2011'), :liter => 25, :mileage => 1350, :amount => 43.0, :car => @first.car)
    end

    it "returns nil for 1st refueling" do
      @first.moving_fuel_cost.should be_nil
    end

    it "returns fuel_consumption for second refueling" do
      @second.fuel_cost.should eql(8.3)
      @second.moving_fuel_cost.should eql(8.3)
    end

    it "returns fuel_consumption up to current refueling" do
      @third.fuel_cost.should eql(17.2)
      @third.moving_fuel_cost.should eql(10.0)
    end

  end

  describe "grouped_by_month" do
    before(:each) do
      @first = Factory(:refueling, :date => Date.parse('13-1-2011'))
      @car = @first.car
      @second = Factory(:refueling, :date => Date.parse('31-1-2011'), :car => @car)
      @third = Factory(:refueling, :date => Date.parse('17-2-2011'), :car => @car)
      @fourth = Factory(:refueling, :date => Date.parse('28-2-2011'))
    end

    it "groups refeulings of the same months" do
      january = Refueling.grouped_by_month[Date.parse('1-1-2011')]
      january.should include(@first)
      january.should include(@second)

      februari = Refueling.grouped_by_month[Date.parse('1-2-2011')]
      februari.should include(@third)
      februari.should include(@fourth)
    end

    it "includes only refueling for specific car" do
      january = @car.refuelings.grouped_by_month[Date.parse('1-1-2011')]
      january.should include(@first)
      january.should include(@second)

      februari = @car.refuelings.grouped_by_month[Date.parse('1-2-2011')]
      februari.should include(@third)
      februari.should_not include(@fourth)

    end
  end

end
