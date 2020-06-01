# frozen_string_literal: true

class Test
  include ActiveModel::Model
  include CardHelper
  include Draper::Decoratable

  attr_accessor :card
  attr_accessor :card_id
  attr_accessor :translated_text
  attr_accessor :success

  def initialize(args = {})
    @user = User.find(args[:user_id])
    @card = args[:card_id].present? ? @user.cards.find(args[:card_id]) : FindTestableCard.new(@user.cards).call
    @translated_text = args[:translated_text]
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

  def process_success
    Card::LeitnerUpdate.new(card).call
    self.success = true
  end

  def successfully_passed?
    translation_correct?
  end

  def translation_correct?
    normalize_card_text(translated_text) == normalize_card_text(card.translated_text)
  end
end
