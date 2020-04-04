# frozen_string_literal: true

RSpec.describe Leitner do
  it 'should define integer rollback level constant' do
    expect(Leitner::ROLLBACK_LEVEL).to be_an(Integer)
  end

  it 'should define integer default level constant' do
    expect(Leitner::DEFAULT_LEVEL).to be_an(Integer)
  end

  it 'should define integer max acceptable attempts constant' do
    expect(Leitner::MAX_ACCEPTABLE_ATTEMPTS).to be_an(Integer)
  end

  it 'should return next review date in period duration for a given leitner level' do
    (0..5).each do |level|
      expect(Leitner.review_period_for_level(level)).to be_an(ActiveSupport::Duration)
    end
  end
end
