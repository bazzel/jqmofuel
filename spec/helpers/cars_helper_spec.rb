require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the CarsHelper. For example:
#
# describe CarsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe CarsHelper do

  describe "fuel_efficiency" do
    it "returns 1:x (L:km)" do
      car = mock_model(Car, :fuel_efficiency => 20)
      helper.fuel_efficiency(car).should eql("1:20.0 (L:km)")
    end

    it "returns nil if car is nil" do
      helper.fuel_efficiency(nil).should be_nil
    end

    it "returns nil if car has no refuelings yet" do
      car = Factory(:car)
      helper.fuel_efficiency(car).should be_nil
    end

  end

  describe "fuel_consumption" do
    it "returns 5.5 (L/100 km)" do
      car = mock_model(Car, :fuel_consumption => 5.5)
      helper.fuel_consumption(car).should eql("5.5 (L/100 km)")
    end

    it "returns nil if car is nil" do
      helper.fuel_consumption(nil).should be_nil
    end

    it "returns nil if car has no refuelings yet" do
      car = Factory(:car)
      helper.fuel_consumption(car).should be_nil
    end

  end

  describe "fuel_cost" do
    it "returns 8.5 c/L" do
      car = mock_model(Car, :fuel_cost => 8.5)
      helper.fuel_cost(car).should eql("8.5 c/L")
    end

    it "returns nil if car is nil" do
      helper.fuel_cost(nil).should be_nil
    end

    it "returns nil if car has no refuelings yet" do
      car = Factory(:car)
      helper.fuel_cost(car).should be_nil
    end

  end

  describe "refueling_ago_in_words" do
    it "returns time_ago_in_words for date of refueling" do
      refueling = mock_model(Refueling, :date => 3.days.ago.to_date)
      car = mock_model(Car, :last_refueling => refueling)

      helper.refueling_ago_in_words(car.last_refueling).should eql("3 days ago")
    end

    it "returns nil if car has no refuelings yet" do
      helper.refueling_ago_in_words(nil).should be_nil
    end
  end
end
