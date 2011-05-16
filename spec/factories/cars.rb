# Read about factories at http://github.com/thoughtbot/factory_girl
require "#{Rails.root}/spec/factories/mileages.rb"

Factory.define :car do |f|
  f.brand "MyString"
  f.car_model "MyString"
  f.mileage (Mileage.first || Factory(:mileage))
  # f.mileage { |m| m.association(:mileage) }
end