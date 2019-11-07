class Test
  include Virtus.model
  include ActiveModel::Model
  include CardHelper

  attribute :card_id, Integer
  attribute :translated_text, String
  attribute :success, Boolean

  def initialize(args = {})
    @card_id = args[:card_id] || Card.to_test.sample&.id
    @translated_text = args[:translated_text]
  end

  def card
    Card.find(card_id)
  end

  def original_text
    card.original_text
  end

  def process!
    if normalize_card(translated_text) != normalize_card(card.translated_text)
      return
    end

    card.update_attribute(:review_date, Date.today + Card::REVIEW_IN_DAYS.days)
    self.success = true
    self
  end
end