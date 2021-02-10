FactoryBot.define do
  factory :customer do
    id  { Faker::Number.number(digits: 5) }
    first_name { "User" }
    last_name { "Example" }
    gender { "male" }
    ph_no { "1234567891" }
    email { "exuser@gmail.com"}
  end
end

def get_customer
  customer = Customer.last || create(:customer)
end
