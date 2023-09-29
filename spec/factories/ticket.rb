FactoryBot.define do
  factory :ticket do
    request_number { "#{Faker::Number.number(digits: 8)}-#{Faker::Number.number(digits: 5)}" }
    sequence_number { Faker::Number.number(digits: 4).to_s }
    request_type { ["Type1", "Type2", "Type3"].sample }
    request_action { ["Action1", "Action2", "Action3"].sample }
    response_due_date_time { Faker::Time.forward(days: 10, period: :all) }

    digsite_info { "POLYGON((30 10, 40 40, 20 40, 10 20, 30 10))" }

    additional_service_area_codes { Array.new(3) { "ASAC#{Faker::Number.number(digits: 2)}" } }
    primary_service_area_code { "PSA#{Faker::Number.number(digits: 3)}" }
  end
end
