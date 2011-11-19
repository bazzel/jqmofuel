Then /^I should see the sign in page$/ do
  step  %{I am on the sign in page}
  step %{I should see "e-fueling" in the header}
  step %{I should see "Sign In" button in the content}
  step %{I should see "Create Account" in the content}
end

When /^I submit an empty login form$/ do
  visit new_user_session_path
  click_button "Sign In"
end

Then /^I see that I should have entered credentials first$/ do
  within('form') do
    page.should have_css('.field_with_errors label', :text => "can't be blank", :count => 2)
  end
end
