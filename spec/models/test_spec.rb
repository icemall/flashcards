# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Test do
  subject(:card) { create(:testable_card) }

  context 'when no card_id provided' do
    let(:test) { Test.new }
    it 'picks testable cards' do
      expect(Card.to_test).to eq([Test.new.card])
    end
  end

  context 'when card_id provided and results are correct' do
    let(:test) { Test.new(card_id: card.id, translated_text: card.translated_text) }

    it 'updates card review_date' do
      expect { test.call }.to(change { card.review_date })
    end

    it 'sets success' do
      expect { test.call }.to(change { card.success })
    end
  end
end
