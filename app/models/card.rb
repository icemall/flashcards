# frozen_string_literal: true

class Card < ApplicationRecord
  validates_with CardSaveValidator
  validates :original_text, :translated_text, :review_date, presence: true
end
