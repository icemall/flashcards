# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Test do
  context 'when no card_id provided' do
    let!(:card) { create(:testable_card) }
    let(:test) { Test.new }
    it 'picks a testable card' do
      expect(test.card).to eq(card)
    end
  end

  context 'when card_id provided and results are correct' do
    let!(:card) { create(:testable_card) }
    let(:test) { Test.new(card_id: card.id, translated_text: card.translated_text) }

    it 'updates card review_date and returns success' do
      expect { test.call }.to change(test.card, :review_date)
        .and change(test, :success).to(true)
    end
  end
end
