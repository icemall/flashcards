# frozen_string_literal: true

class Card < ApplicationRecord
  validates :original_text, :translated_text, :review_date, presence: true
  validate :texts_are_different

  before_create :set_review_date

  private

  def normalize(string)
    return unless string
    string.strip.downcase
  end

  def set_review_date
    self.review_date = Date.today + 3.days
  end

  def texts_are_different
    errors.add(:base, I18n.t('texts_should_be_different')) if normalize(original_text) == normalize(translated_text) && original_text.present?
  end
end
