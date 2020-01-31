# frozen_string_literal: true

class Card < ApplicationRecord
  REVIEW_IN_DAYS = 3

  belongs_to :user

  validates_with CardSaveValidator
  validates :original_text, :translated_text,
            :review_date, :user_id,
            presence: true

  scope :to_test, -> { where('review_date <= ?', Date.today) }
end
