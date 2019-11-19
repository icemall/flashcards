# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Card, type: :model do
  it { should validate_presence_of(:original_text) }
  it { should validate_presence_of(:translated_text) }
  it { should validate_presence_of(:review_date) }

  describe '.to_test' do
    let!(:card_to_review1) { create(:card, review_date: Date.today) }
    let!(:card_to_review2) { create(:card, review_date: Date.today) }
    let!(:card_not_to_review) { create(:card, review_date: Date.tomorrow) }
    it "applies cards with review date eq to today or earlier to 'to_test' scope" do
      expect(Card.to_test).to eq [card_to_review1, card_to_review2]
    end
  end
end
