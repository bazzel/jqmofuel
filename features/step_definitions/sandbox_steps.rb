World(Rack::Test::Methods)

Given /^I am have an iPhone$/ do
  agent = "Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_1 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8B117 Safari/6531.22.7"
  header 'User-Agent', agent
end

When /^I surf to the home page$/ do
  get '/cars'
end

Then /^well euh$/ do
  p last_response
end
