# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :refueling do |f|
  f.date Time.now
  f.amount 9.99
  f.liter 9.99
  f.mileage 100
  f.car { |c| c.association(:car)}
end