# frozen_string_literal: true

class Card < ApplicationRecord
  REVIEW_IN_DAYS = 3

  mount_uploader :picture, PictureUploader

  belongs_to :deck
  belongs_to :user

  validates_with CardSaveValidator
  validates :original_text, :translated_text,
            :review_date, :user_id, :deck_id,
            presence: true

  scope :to_test, -> { joins(:deck).where('review_date <= ?', Date.today).merge(Deck.to_test) }
end
