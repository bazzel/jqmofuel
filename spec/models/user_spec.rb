require 'spec_helper'

describe User do
  it { should have_many(:cars, :dependent => :destroy) }
  it { should have_many(:refuelings) }
  it { should belong_to(:mileage) }
  it { should belong_to(:volume) }

  it { should validate_presence_of(:mileage) }
  it { should validate_presence_of(:volume) }

  describe "#new_default" do
    before(:each) do
      @kilometer = Factory(:mileage, :unit => 'km', :name => 'kilometer')
      @mile = Factory(:mileage, :unit => 'mi', :name => 'mile')
    end

    describe "mileage" do
      before(:each) do
        Mileage.stub(:find_by_unit).with('km').and_return(@kilometer)
        Volume.stub(:find_first_by_unit).with('l').and_return(mock_model(Volume))
      end

      it "should set mileage if not provided" do
        user = User.new_default
        user.mileage.should eql(@kilometer)
      end

      it "should use provided mileage" do
        user = User.new_default(:mileage => @mile)
        user.mileage.should eql(@mile)
      end

      it "should use provided mileage_id" do
        user = User.new_default(:mileage_id => @mile.id)
        user.mileage.should eql(@mile)
      end
    end

    describe "volume" do
      before(:each) do
        @litre = Factory(:volume, :unit => 'l', :name => 'litre')
        Volume.stub(:find_first_by_unit).with('l').and_return(@litre)
        Mileage.stub(:find_by_unit).with('km').and_return(@kilometer)
      end

      it "should set volume if not provided" do
        user = User.new_default
        user.volume.should eql(@litre)
      end

      it "should use provided volume" do
        gallon = Factory(:volume, :unit => 'gal', :name => 'gallon')
        user = User.new_default(:volume => gallon)

        user.volume.should eql(gallon)
      end

      it "should use provided volume_id" do
        gallon = Factory(:volume, :unit => 'gal', :name => 'gallon')
        user = User.new_default(:volume_id => gallon.id)

        user.volume.should eql(gallon)
      end

    end
  end
end
