# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

  fuels = [
    ["Gasoline", "Benzine"],
    ["Diesel", "Diesel"],
    ["Electric", "Elektrisch"],
    ["Hybrid", "Hybride"],
    ["LPG", "LPG"],
    ["Natural gas", "Aardgas"],
    ["Other", "Overig"]
  ]

  fuels.each do |fuel|
    I18n.locale = 'en'
    f = Fuel.find_or_initialize_by_name(fuel.first)
    I18n.locale = 'nl'
    f.name = fuel.last
    f.save
  end