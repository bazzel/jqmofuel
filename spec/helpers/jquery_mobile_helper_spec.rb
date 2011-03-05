require 'spec_helper'

describe JqueryMobileHelper do
  describe "jqm_header" do
    it "wraps content in a div tag" do
      jqm_header = helper.jqm_header { "Foo" }

      jqm_header.should have_selector(:div, :'data-role' => "header", :content => "Foo")
    end
  end

  describe "jqm_content" do
    it "wraps content in a div tag" do
      jqm_content = helper.jqm_content { "Foo" }

      jqm_content.should have_selector(:div, :'data-role' => "content", :content => "Foo")
    end
  end
end
