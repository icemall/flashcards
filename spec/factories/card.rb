FactoryBot.define do
  factory :card do
    original_text { Faker::Address.city }
    translated_text  { Faker::Address.city }
    review_date { Date.today }
  end
end