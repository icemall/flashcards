# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Card, type: :model do
  it { should validate_presence_of(:original_text) }
  it { should validate_presence_of(:translated_text) }
  it { should validate_presence_of(:review_time) }
end
