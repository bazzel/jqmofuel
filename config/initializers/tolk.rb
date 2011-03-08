begin
  require 'tolk/sync'
  require 'tolk/import'
rescue LoadError
  puts "Not loading tolk, since it's missing"
end
