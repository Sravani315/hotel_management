FactoryBot.define do
  factory :room_type do
    id  { Faker::Number.number(digits: 5) }
    first_name { "Single" }
  end
end
