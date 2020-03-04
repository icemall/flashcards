# frozen_string_literal: true

# updates card according to Leitner methodology
class Card::LeitnerUpdate
  attr_accessor :card

  def initialize(card)
    @card = card
  end

  def call
    set_leitner_level
    set_review_time
    reset_attempts
    card.save!
  end

  private

  def reset_attempts
    card.attempts = 0
  end

  def set_leitner_level
    if card.attempts <= Leitner::MAX_ACCEPTABLE_ATTEMPTS
      card.leitner_level += 1
    else
      card.leitner_level = Leitner::ROLLBACK_LEVEL
    end
  end

  def set_review_time
    card.review_time = Time.now + Leitner.review_period_for_level(card.leitner_level)
  end
end
