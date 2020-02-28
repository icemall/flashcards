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
    @card = args[:card_id].present? ? @user.cards.find(args[:card_id]) : @user.cards.to_test.sample
    @translated_text = args[:translated_text]
  end

  def call
    return unless successfully_passed?

    card.update!(review_date: Date.today + Card::REVIEW_IN_DAYS.days)
    self.success = true
    self
  end

  def original_text
    card.original_text
  end

  def successfully_passed?
    translation_correct?
  end

  private

  def translation_correct?
    normalize_card_text(translated_text) == normalize_card_text(card.translated_text)
  end
end
