# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    original_text { 'cat' }
    translated_text { 'кошка' }
    review_date { Date.today }
  end
end
