# frozen_string_literal: true

class CardSaveValidator < ActiveModel::Validator
  include CardHelper

  def validate(card)
    card.errors.add(:base, I18n.t('texts_should_be_different')) if texts_are_same?(card)
  end

  private

  def texts_are_same?(card)
    normalize_card_text(card.original_text) == normalize_card_text(card.translated_text) && card.original_text.present?
  end
end
