require 'spec_helper'

describe User do
  it { should have_many(:cars, :dependent => :destroy) }
  it { should have_many(:refuelings) }
  it { should belong_to(:mileage) }

  it { should validate_presence_of(:mileage) }

  describe "#new_default" do
    before(:each) do
      @mile = Factory(:mileage, :unit => 'mi', :name => 'mile')
      Mileage.stub(:find_by_unit).and_return(@mile)
    end
    it "should set mileage if not provided" do
      user = User.new_default
      user.mileage.should eql(@mile)
    end

    it "should use provided mileage" do
      kilometre = Factory(:mileage, :unit => 'km', :name => 'kilometre')
      user = User.new_default(:mileage => kilometre)

      user.mileage.should eql(kilometre)
    end

    it "should use provided mileage_id" do
      kilometre = Factory(:mileage, :unit => 'km', :name => 'kilometre')
      user = User.new_default(:mileage_id => kilometre.id)

      user.mileage.should eql(kilometre)
    end
  end
end
