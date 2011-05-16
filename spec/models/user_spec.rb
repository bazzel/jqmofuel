require 'spec_helper'

describe User do
  it { should have_many(:cars, :dependent => :destroy) }
  it { should have_many(:refuelings, :through => :cars) }
  it { should belong_to(:volume) }

  it { should validate_presence_of(:volume) }

  describe "#new_default" do
    describe "volume" do
      before(:each) do
        @litre = Factory(:volume, :unit => 'l', :name => 'litre')
        Volume.stub(:find_first_by_unit).with('l').and_return(@litre)
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
