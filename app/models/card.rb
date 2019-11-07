# frozen_string_literal: true

class Card < ApplicationRecord
  REVIEW_IN_DAYS = 3

  validates_with CardSaveValidator
  validates :original_text, :translated_text, :review_date, presence: true

  scope :to_test, -> { where('review_date <= ?', Date.today) }
end
