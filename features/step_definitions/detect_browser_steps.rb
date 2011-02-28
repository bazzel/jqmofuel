Given /^(?:|I )am using (.+)$/ do |browser|
  case browser
  when /mobile safari/
    agent = "Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_1 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8B117 Safari/6531.22.7"
    add_headers({'HTTP_USER_AGENT' => agent})
  else
    # don't set a special User-Agent header
  end
end