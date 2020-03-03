# frozen_string_literal: true

class Card < ApplicationRecord
  REVIEW_IN_DAYS = 3

  mount_uploader :picture, PictureUploader

  belongs_to :deck
  delegate :user, to: :deck

  validates_with CardSaveValidator
  validates :original_text, :translated_text,
            :review_date, :deck_id,
            presence: true
end
