When /^(?:|I )tab on "([^"]*)"(?: within "([^"]*)")?$/ do |link, selector|
  with_scope(selector) do
    click_link(link)
  end
end

# == Then
#
# Then I should see "e-fueling" in the header
#
Then /^I should see "([^"]*)" in the header$/ do |text|
  within('div[@data-role="header"]') do
    page.should have_content(text)
  end
end

# Then I should see "Sign In" button in the content
#
Then /^I should see "([^"]*)" in the content$/ do |text|
  within('div[@data-role="content"]') do
    page.should have_content(text)
  end
end

# And I should see "Create Account" in the content
#
Then /^I should see "([^"]*)" button in the content$/ do |text|
  within('div[@data-role="content"]') do
    find_button(text).should_not be_nil
  end
end
