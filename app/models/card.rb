class Card < ApplicationRecord
  validates :original_text, :translated_text, :review_date, presence: true
end