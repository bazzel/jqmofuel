# == Given
Given /^I am not signed in$/ do
  true
end

Given /^I am logged in as a user with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  Given %{a user "current_user" exists with email: "#{email}", password: "#{password}"}

  And %{I go to login}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign In"}
end

# == When

# == Then
