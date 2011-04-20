# This file must be loaded early (at least before devise.rb)
APP_CONFIG = YAML::load(ERB.new(IO.read(File.join(Rails.root, 'config', 'application.yml'))).result)[Rails.env]