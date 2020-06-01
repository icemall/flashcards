# frozen_string_literal: true

RSpec.describe Card::LeitnerUpdate do
  let(:card) { create :card }

  it 'resets card attempts' do
    card.attempts = 2
    expect { Card::LeitnerUpdate.new(card).call }.to change(card, :attempts).to(0)
  end

  it 'updates review time' do
    expect { Card::LeitnerUpdate.new(card).call }.to change(card, :review_time)
  end

  context 'when passing attempts number did not exceed maximum acceptable' do
    it 'upgrades leitner level' do
      card.attempts = Leitner::MAX_ACCEPTABLE_ATTEMPTS - 1
      expect { Card::LeitnerUpdate.new(card).call }.to change(card, :leitner_level).by(1)
    end
  end

  context 'when passing attempts number exceeded maximum acceptable' do
    it 'rolls back leitner level' do
      card.attempts = Leitner::MAX_ACCEPTABLE_ATTEMPTS + 1
      expect { Card::LeitnerUpdate.new(card).call }.to change(card, :leitner_level).to(Leitner::ROLLBACK_LEVEL)
    end
  end
end
