# Read about factories at http://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :user do
    password = 'secret'
    email 'john@example.com'
    password password
    password_confirmation password
    volume { |v| v.association(:volume)}
  end
end
