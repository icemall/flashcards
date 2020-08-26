# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Card, type: :model do
  it { should validate_presence_of(:original_text) }
  it { should validate_presence_of(:translated_text) }
  it { should validate_presence_of(:review_time) }
  it 'should have a testable scope that returns cards with review date older than now' do
    testable_card = create(:testable_card)
    non_testable_card = create(:non_testable_card)
    expect(Card.testable).to include(testable_card)
    expect(Card.testable).to_not include(non_testable_card)
  end
end
