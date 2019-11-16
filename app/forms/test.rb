class Test
  include ActiveModel::Model
  include CardHelper

  attr_accessor :card
  attr_accessor :card_id
  attr_accessor :translated_text
  attr_accessor :success

  def initialize(args = {})
    @card = args[:card_id].present? ? Card.find(args[:card_id]) : Card.to_test.sample
    @translated_text = args[:translated_text]
  end

  def original_text
    card.original_text
  end

  def call
    if normalize_card(translated_text) != normalize_card(card.translated_text)
      return
    end

    card.update(review_date: Date.today + Card::REVIEW_IN_DAYS.days)
    self.success = true
    self
  end
end