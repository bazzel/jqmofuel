require 'spec_helper'

describe Car do
  it { should validate_presence_of(:brand) }
  it { should have_many(:refuelings) }

  describe "last_fueling" do
    before(:each) do
      @car = Factory(:car)
    end
    it "returns nil if refuelings are empty" do
      @car.last_refueling.should be_nil
    end

    it "returns last refueling" do
      first = Factory(:refueling, :car => @car, :date => 10.days.ago)
      last = Factory(:refueling, :car => @car, :date => 1.day.ago)
      @car.last_refueling.should eql(last)
    end
  end
end
