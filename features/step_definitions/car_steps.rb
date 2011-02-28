Given /^the following cars:$/ do |cars|
  Car.create!(cars.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) car$/ do |pos|
  visit cars_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following cars:$/ do |expected_cars_table|
  expected_cars_table.diff!(tableish('table tr', 'td,th'))
end
