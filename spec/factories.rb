# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '123qwe' }
    password_confirmation { password }
  end
  factory :deck do
    name { 'Some deck name' }
    user
    factory :invalid_deck do
      name { nil }
      user { nil }
    end
  end
  factory :card do
    original_text { Faker::Book.title }
    translated_text { Faker::Game.title }
    review_date { Date.today }
    deck
    factory :testable_card do
      review_date { Date.today }
    end
    factory :nontestable_card do
      review_date { Date.tomorrow }
    end
  end
end
