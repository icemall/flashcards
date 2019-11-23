# frozen_string_literal: true

require 'rails_helper'
# TODO fix this
RSpec.describe Test do
  before do
    let!(:card) { create(:testable_card) }
  end
  context 'with no card_id provided' do
    let(:test) { Test.new }
    it 'picks testable cards' do
      expect(Card.to_test).to eq([Test.new.card])
    end
  end
  context 'with card_id provided and correct results' do
    let(:test) { Test.new(card_id: card.id, translated_text: card.translated_text) }
    it 'picks card using card_id param' do
      expect(test.card_id).to eq(card.id)
    end

    it 'updates card review_date' do
      expect(test.call).to change(card.review_date)
    end

    it 'sets success' do
      expect(test.call).to change(card.succes)
    end
  end
end