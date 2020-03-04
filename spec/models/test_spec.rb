# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Test do
  let!(:card) { create(:testable_card) }

  context 'when no card_id provided' do
    let(:test) { Test.new(user_id: card.user.id) }
    it 'picks a testable card' do
      expect(test.card).to eq(card)
    end
  end

  context 'when card_id provided and results are correct' do
    let(:test) { Test.new(card_id: card.id, translated_text: card.translated_text, user_id: card.user.id) }

    it 'updates card review_time and returns success' do
      expect { test.call }.to change(test.card, :review_time)
        .and change(test, :success).to(true)
    end
  end
end
