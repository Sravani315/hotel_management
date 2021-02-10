FactoryBot.define do
  factory :price do
    room_type
    id  { Faker::Number.number(digits: 5) }
    amount { 4000 }
    currency { 'INR' }
  end
end
