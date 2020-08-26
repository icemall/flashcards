# frozen_string_literal: true

class User
  # notifies users with pending cards
  class NotifyOfPendingCards
    class << self
      def call
        User.with_pending_cards.each do |user|
          NotificationMailer.notify_of_pending_cards(user).deliver_later
        end
      end
    end
  end
end
