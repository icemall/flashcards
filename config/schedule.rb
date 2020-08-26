# frozen_string_literal: true

every 1.day do
  runner 'User.notify_of_pending_cards'
end
