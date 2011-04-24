# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :user do |f|
  password = 'secret'
  f.email 'john@example.com'
  f.password password
  f.password_confirmation password
  f.mileage { |m| m.association(:mileage)}
  f.volume { |v| v.association(:volume)}
end