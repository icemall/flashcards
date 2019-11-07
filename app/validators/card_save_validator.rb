# frozen_string_literal: true

class CardSaveValidator < ActiveModel::Validator
  def validate(card)
    if texts_are_same?(card)
      card.errors.add(:base, I18n.t('texts_should_be_different'))
    end
  end

  private

  def normalize(string)
    return unless string

    string.strip.downcase
  end

  def texts_are_same?(card)
    normalize(card.original_text) == normalize(card.translated_text) && card.original_text.present?
  end
end
