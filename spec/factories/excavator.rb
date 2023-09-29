FactoryBot.define do
  factory :excavator do
    ticket
    company_name { Faker::Company.name }
    address { Faker::Address.full_address }
  end
end
