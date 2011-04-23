require 'spec_helper'

describe App do
  describe "name" do
    it "should return name of the app" do
      App.name.should eql('e-fueling')
    end
  end

  describe "host" do
    it "should return host name" do
      App.host.should eql('test.efueling.nl')
    end
  end
end
