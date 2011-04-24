require 'spec_helper'

describe Volume do
  it { should validate_presence_of(:unit) }
  it { should validate_presence_of(:name) }
  it { Factory(:volume); should validate_uniqueness_of(:unit) }
  it { Factory(:volume); should validate_uniqueness_of(:name) }

  describe "globalize" do
    it "translates name" do
      volume = Factory(:volume, :unit => 'L', :name => "litre")

      I18n.locale = 'nl'
      volume.unit = 'l'
      volume.name = "liter"

      I18n.locale = 'en'
      volume.unit.should eql('L')
      volume.name.should eql('litre')

      I18n.locale = 'nl'
      volume.unit.should eql('l')
      volume.name.should eql('liter')
    end

    it "fallbacks to 'en'" do
      volume = Factory(:volume, :unit => 'L', :name => "litre")

      I18n.locale = 'nl'
      volume.name.should eql('litre')
    end
  end

  after(:all) do
    I18n.locale = I18n.default_locale
  end
end
