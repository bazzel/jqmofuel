# Loads patches stored in lib/patches.
Dir[Rails.root.to_s + "/lib/patches/**/*.rb"].each { |file| require file }