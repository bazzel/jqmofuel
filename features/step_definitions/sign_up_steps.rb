When /^I enter no data for a new account$/ do
  click_button "Sign Up"
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

When /^I didn't confirm my password$/ do
  within('#user_new') do
    fill_in 'user[email]', :with => 'john.doe@example.com'
    fill_in 'user[password]', :with => 'Secret.1'
  end
  click_button "Sign Up"
end

Then /^I see that the password I entered doesn't match confirmation$/ do
  within('form') do
    page.should have_css('.field_with_errors label', :text => "doesn't match confirmation")
  end
end
