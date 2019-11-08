# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Card, type: :model do
  it { should validate_presence_of(:original_text) }
  it { should validate_presence_of(:translated_text) }
  it { should validate_presence_of(:review_date) }
  it "applies cards with review date eq to today or earlier to 'to_test' scope" do
    expect(Card.to_test).to eq Card.where('review_date <= ?', Date.today)
  end
end
