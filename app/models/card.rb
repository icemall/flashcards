# frozen_string_literal: true

class Card < ApplicationRecord
  validates :original_text, :translated_text, :review_date, presence: true
  validate :texts_are_different

  private

  def normalize(string)
    string.strip.downcase
  end

  def texts_are_different
    errors.add(:base, I18n.t('texts_should_be_different')) if normalize(original_text) == normalize(translated_text) && original_text.present?
  end
end
