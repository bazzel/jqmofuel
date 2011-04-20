# Loads patches stored in lib/patches.
Dir[RAILS_ROOT + "/lib/patches/**/*.rb"].each { |file| require file }