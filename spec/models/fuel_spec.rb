require 'spec_helper'

describe Fuel do
  it { should validate_presence_of(:name) }
  it { Factory(:fuel); should validate_uniqueness_of(:name) }

  describe "globalize" do
    it "translates name" do
      fuel = Factory(:fuel, :name => "Gasoline")

      I18n.locale = 'nl'
      fuel.name = "Benzine"

      I18n.locale = 'en'
      fuel.name.should eql('Gasoline')

      I18n.locale = 'nl'
      fuel.name.should eql('Benzine')
    end

    it "fallbacks to 'en'" do
      fuel = Factory(:fuel, :name => "Gasoline")

      I18n.locale = 'nl'
      fuel.name.should eql('Gasoline')
    end
  end

  after(:all) do
    I18n.locale = I18n.default_locale
  end
end
