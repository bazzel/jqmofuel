Then /^I should see the sign in page$/ do
  step  %{I am on the sign in page}
  step %{I should see "e-fueling" in the header}
  step %{I should see "Sign In" button in the content}
  step %{I should see "Create Account" in the content}
end
