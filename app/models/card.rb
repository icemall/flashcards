# frozen_string_literal: true

class Card < ApplicationRecord
  validates :original_text, :translated_text, :review_date, presence: true
  validate :texts_are_different

  private

  def normalize(string)
    return unless string

    string.strip.downcase
  end

  def texts_are_different
    if normalize(original_text) == normalize(translated_text) && original_text.present?
      errors.add(:base, I18n.t('texts_should_be_different'))
    end
  end
end
