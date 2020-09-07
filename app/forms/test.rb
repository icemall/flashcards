# frozen_string_literal: true

require 'damerau-levenshtein'
class Test
  include ActiveModel::Model
  include CardHelper
  include Draper::Decoratable

  ALLOWED_NUMBER_OF_TYPOS = 1

  attr_accessor :card
  attr_accessor :card_id
  attr_accessor :feedback
  attr_accessor :translated_text
  attr_accessor :success

  def initialize(args = {})
    @user = User.find(args[:user_id])
    @card = args[:card_id].present? ? @user.cards.find(args[:card_id]) : FindTestableCard.new(@user.cards).call
    @translated_text = normalize_card_text(args[:translated_text])
  end

  def call
    add_attempt
    process_success if successfully_passed?
    self
  end

  def original_text
    card.original_text
  end

  private

  def add_attempt
    card.attempts += 1
    card.save!
  end

  def success_feedback
    perfectly_translated? ? I18n.t('test.perfect_translation_feedback') : I18n.t('test.translation_with_typos_feedback', typo: translated_text)
  end

  def successfully_passed?
    perfectly_translated? || translated_with_typos?
  end

  def perfectly_translated?
    normalize_card_text(translated_text) == normalize_card_text(card.translated_text)
  end

  def process_success
    Card::LeitnerUpdate.new(card).call
    self.success = true
    self.feedback = success_feedback
  end

  def translated_with_typos?
    DamerauLevenshtein.distance(normalize_card_text(translated_text), normalize_card_text(card.translated_text)) <= ALLOWED_NUMBER_OF_TYPOS
  end
end
