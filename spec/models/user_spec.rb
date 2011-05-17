require 'spec_helper'

describe User do
  before(:each) do
    @volume = mock_model(Volume, :id => 1, :unit => 'l', :name => 'litre')
    Volume.stub(:find_first_by_unit).with('l').and_return(@volume)
  end
  
  describe "associations" do
    it { should have_many(:cars, :dependent => :destroy) }
    it { should have_many(:refuelings, :through => :cars) }
    it { should belong_to(:volume) }
  end

  describe "validations" do
    it { should validate_presence_of(:volume) }
  end

  describe "defaults" do
    it "should set volume if not provided" do
      User.new.volume.should eql(@volume)
    end
  end
end
