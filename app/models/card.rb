class Card < ApplicationRecord
  validates_presence_of :original_text, :translated_text, :review_date
end