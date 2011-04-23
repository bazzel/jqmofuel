require 'spec_helper'

describe Mileage do
  it { should validate_presence_of(:unit) }
  it { should validate_presence_of(:name) }
  it { Factory(:mileage); should validate_uniqueness_of(:unit) }
  it { Factory(:mileage); should validate_uniqueness_of(:name) }

  describe "globalize" do
    it "translates name" do
      fuel = Factory(:mileage, :unit => 'mi', :name => "mile")

      I18n.locale = 'nl'
      fuel.name = "mijl"

      I18n.locale = 'en'
      fuel.name.should eql('mile')

      I18n.locale = 'nl'
      fuel.name.should eql('mijl')
    end

    it "fallbacks to 'en'" do
      fuel = Factory(:mileage, :unit => 'mi', :name => "mile")

      I18n.locale = 'nl'
      fuel.name.should eql('mile')
    end
  end

  after(:all) do
    I18n.locale = I18n.default_locale
  end
end
