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

  mileages = {
    :km => ["kilometre", "kilometer"],
    :mi => ["mile", "mijl"]
  }

  mileages.each do |unit, name|
    I18n.locale = 'en'
    f = Mileage.find_or_initialize_by_unit(unit.to_s)
    f.name = name.first
    I18n.locale = 'nl'
    f.name = name.last
    f.save
  end