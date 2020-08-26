# frozen_string_literal: true

RSpec.describe User::NotifyOfPendingCards do
  ActiveJob::Base.queue_adapter = :test
  let(:user) { create(:user) }

  it 'notifies users having pending cards' do
    create(:testable_card, deck: create(:deck, user: user))

    expect { User::NotifyOfPendingCards.call }.to have_enqueued_job.on_queue('mailers')
  end

  it 'doesn\'t notify users without pending cards' do
    create(:non_testable_card, deck: create(:deck, user: user))

    expect { User::NotifyOfPendingCards.call }.to_not have_enqueued_job.on_queue('mailers')
  end
end
