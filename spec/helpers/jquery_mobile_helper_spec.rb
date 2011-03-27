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
              li.should have_selector("a[href='#{new_refueling_path}']", :content => "Refueling", :id => "refueling")
              li.should have_selector("a[href='#{cars_path}']", :content => "Cars", :id => "cars")
              li.should have_selector("a[href='#{edit_user_registration_path}']", :content => "My Info", :id => "my-info")
            end
          end
        end
      end
    end

    it "highlights 'Refueling'" do
      jqm_footer = helper.jqm_footer(:refueling)

      jqm_footer.should have_selector(:div, :'data-role' => 'footer', :'data-position' => "fixed") do |footer|
        footer.should have_selector(:li) do |li|
          li.should have_selector(:a, :class => "ui-btn-active", :content => "Refueling")

          li.should have_selector(:a, :content => "Cars") do |a|
            a.should_not have_selector(:class)
          end

          li.should have_selector(:a, :content => "My Info") do |a|
            a.should_not have_selector(:class)
          end
        end
      end

    end

    it "highlights 'Cars'" do
      jqm_footer = helper.jqm_footer(:cars)

      jqm_footer.should have_selector(:div, :'data-role' => 'footer', :'data-position' => "fixed") do |footer|
        footer.should have_selector(:li) do |li|
          li.should have_selector(:a, :content => "Refueling") do |a|
            a.should_not have_selector(:class)
          end

          li.should have_selector(:a, :class => "ui-btn-active", :content => "Cars")


          li.should have_selector(:a, :content => "My Info") do |a|
            a.should_not have_selector(:class)
          end
        end
      end

    end

    it "highlights 'My Info'" do
      jqm_footer = helper.jqm_footer(:my_info)

      jqm_footer.should have_selector(:div, :'data-role' => 'footer', :'data-position' => "fixed") do |footer|
        footer.should have_selector(:li) do |li|
          li.should have_selector(:a, :content => "Refueling") do |a|
            a.should_not have_selector(:class)
          end

          li.should have_selector(:a, :content => "Cars") do |a|
            a.should_not have_selector(:class)
          end

          li.should have_selector(:a, :class => "ui-btn-active", :content => "My Info")
        end
      end

    end
  end

  describe "navigation_buttons" do
    it "returns html for navigation buttons" do
      next_url = 'http://www.example.com'
      navigation_buttons = helper.navigation_buttons(next_url)

      navigation_buttons.should have_selector(:div, :'data-role' => "controlgroup", :'data-type' => "horizontal") do |controlgroup|
        controlgroup.should have_selector("a[href='#']", :content => "Previous", :'data-role' => "button", :'data-icon' => "arrow-l", :'data-rel' => "back")
        controlgroup.should have_selector("a[href='#{next_url}']", :content => "Next", :'data-role' => "button", :'data-icon' => "arrow-r", :'data-iconpos' => "right")
      end
    end
  end
end