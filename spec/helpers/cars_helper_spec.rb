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

  describe "fuel_consumption" do
    it "returns 1:x (L:km)" do
      car = mock_model(Car, :fuel_consumption => 20)
      helper.fuel_consumption(car).should eql("1:20 (L:km)")
    end

    it "returns nil if car is nil" do
      helper.fuel_consumption(nil).should be_nil
    end

    it "returns nil if car has no refuelings yet" do
      car = Factory(:car)
      helper.fuel_consumption(car).should be_nil
    end

  end


  describe "last_refueling_in_words" do
    it "returns time_ago_in_words for date of last refueling" do
      refueling = mock_model(Refueling, :date => 3.days.ago)
      car = mock_model(Car, :last_refueling => refueling)

      helper.last_refueling_in_words(car).should eql("3 days ago")
    end

    it "returns nil if car is nil" do
      helper.last_refueling_in_words(nil).should be_nil
    end

    it "returns nil if car has no refuelings yet" do
      car = Factory(:car)
      helper.last_refueling_in_words(car).should be_nil
    end
  end
end
