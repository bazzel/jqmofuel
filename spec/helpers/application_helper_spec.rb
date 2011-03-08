require 'spec_helper'

describe ApplicationHelper do
  describe "locale_selection" do
    it "returns an array with elements consisting of language,locale pairs ordered by language" do
      I18n.stub(:available_locales).and_return([:en, :nl])
      helper.locale_selection.should eql([["English", "en"], ["Nederlands", "nl"]])
    end
  end
end
