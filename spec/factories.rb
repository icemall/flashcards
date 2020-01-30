# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    original_text { Faker::Book.title }
    translated_text { Faker::Game.title }
    factory :testable_card do
      review_date { Date.today }
    end
    factory :nontestable_card do
      review_date { Date.tomorrow }
    end
  end
end
