Then /^I should see the sign in page$/ do
  step %{I am on the sign in page}
  step %{I should see "e-fueling" in the header}
  step %{I should see "Sign In" button in the content}
  step %{I should see "Create Account" in the content}
end

When /^I submit an empty sign in form$/ do
  visit new_user_session_path
  click_button "Sign In"
end

Then /^I see that I should have entered credentials first$/ do
  within('form') do
    page.should have_css('.field_with_errors label', :text => "can't be blank", :count => 2)
  end
end

Given /^I submit the sign in form with invalid credentials$/ do
  visit new_user_session_path
  within('#user_new') do
    fill_in 'user[email]', :with => 'john.doe@example.com'
    fill_in 'user[password]', :with => 'Secret.1'
  end
  click_button "Sign In"
end

Then /^I see that I have entered invalid credentials$/ do
  within('#flash_alert') do
    page.should have_content('Invalid email or password.')
  end
end

When /^I choose to create a new account$/ do
  visit new_user_session_path
  click_link "Create Account"
  step %{I should see "Create Account" in the header}
end

When /^I enter valid data for a new account$/ do
  within('#user_new') do
    fill_in 'user[email]', :with => 'john.doe@example.com'
    fill_in 'user[password]', :with => 'Secret.1'
    fill_in 'user[password_confirmation]', :with => 'Secret.1'
  end
  click_button "Sign Up"
end

Then /^I should see a page for entering a new car$/ do
  step %{I should see "Add Car" in the header}
end
