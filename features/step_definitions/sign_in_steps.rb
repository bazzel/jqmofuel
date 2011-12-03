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

Then /^I should see a page for entering a new car$/ do
  step %{I should see "Add Car" in the header}
end

When /^I forgot my password$/ do
  visit new_user_session_path
  click_link "Forgot Password"
end

Then /^I can ask for an email with instructions about how to reset my password$/ do
  within('#user_new') do
    fill_in 'user[email]', :with => 'john.doe@example.com'
  end
  click_button "Submit"
  step %{"john.doe@example.com" should receive an email}
end

When /^I ask for reset password instructions without providing an email address$/ do
  click_button "Submit"
end

Then /^I see that I should have entered an email address first$/ do
  within('form') do
    page.should have_css('.field_with_errors label', :text => "can't be blank")
  end
end

When /^I ask for reset password instructions for an invalid email address$/ do
  within('#user_new') do
    fill_in 'user[email]', :with => 'unknown@example.com'
  end
  click_button "Submit"
end

Then /^I see that I should have entered a valid email address first$/ do
  within('#error_explanation') do
    page.should have_content('Email not found')
  end
end
