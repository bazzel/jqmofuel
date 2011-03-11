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

  describe "jqm_footer" do
    it "returns html for the footer bar" do
      jqm_footer = helper.jqm_footer

      jqm_footer.should have_selector(:div, :'data-role' => 'footer', :'data-position' => "fixed") do |footer|
        footer.should have_selector(:div, :'data-role' => 'navbar') do |navbar|
          navbar.should have_selector(:ul) do |ul|
            ul.should have_selector(:li) do |li|
              li.should have_selector("a[href='#{new_refueling_path}']", :content => "Refueling")
              li.should have_selector("a[href='#{cars_path}']", :content => "Cars")
              li.should have_selector("a[href='#{edit_user_registration_path}']", :content => "My Info")
            end
          end
        end
      end
    end

    it "highlights " do

    end
  end
end