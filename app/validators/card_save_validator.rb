# frozen_string_literal: true

class CardSaveValidator < ActiveModel::Validator
  def validate(record)
    if texts_are_different(record)
      record.errors.add(:base, I18n.t('texts_should_be_different'))
    end
  end

  private

  def normalize(string)
    return unless string

    string.strip.downcase
  end

  def texts_are_different(record)
    normalize(record.original_text) == normalize(record.translated_text) && record.original_text.present?
  end
end
