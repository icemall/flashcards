# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Test do
  let!(:card) { create(:testable_card, translated_text: 'кошка') }

  context 'when no card_id provided' do
    let(:test) { Test.new(user_id: card.user.id) }
    it 'picks a testable card' do
      expect(test.card).to eq(card)
    end
  end

  context 'when card_id is provided' do
    context 'when translation is perfectly correct' do
      let(:test) { Test.new(card_id: card.id, translated_text: card.translated_text, user_id: card.user.id) }

      it 'updates card review_time and returns success' do
        expect { test.call }.to change(test.card, :review_time)
                                    .and change(test, :success).to(true)
      end

      context 'when passing attempts did not exceed max allowed number' do
        it 'upgrades Leitner level and sets appropriate review time' do
          test.card.attempts = Leitner::MAX_ACCEPTABLE_ATTEMPTS - 1
          Timecop.freeze
          expect { test.call }.to change(test.card, :leitner_level).by(1)
                                      .and change(test.card, :review_time)
                                               .to(Leitner.review_period_for_level(test.card.leitner_level + 1).from_now)
        end
      end

      context 'when passing attempts exceeded max allowed number' do
        it 'resets Leitner level and sets appropriate review time' do
          test.card.attempts = Leitner::MAX_ACCEPTABLE_ATTEMPTS + 1
          Timecop.freeze
          expect { test.call }.to change(test.card, :leitner_level).to(Leitner::ROLLBACK_LEVEL)
                                      .and change(test.card, :review_time)
                                               .to(Leitner.review_period_for_level(Leitner::ROLLBACK_LEVEL).from_now)
        end
      end
    end

    context 'when translation is correct but has a typo' do
      let(:test) { Test.new(card_id: card.id, translated_text: 'кокша', user_id: card.user.id) }

      it 'updates card review_time and returns success' do
        expect { test.call }.to change(test, :success).to(true)
      end
    end
  end
end
