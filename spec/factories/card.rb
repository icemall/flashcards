# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    original_text { Faker::Book.title }
    translated_text { Faker::Game.title }
    review_date { Date.today }
  end
end
