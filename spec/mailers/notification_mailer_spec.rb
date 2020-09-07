# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NotificationMailer, type: :mailer do
  describe 'notify' do
    let(:user) { create :user }
    let(:mail) { NotificationMailer.notify_of_pending_cards(user) }

    it 'renders the headers' do
      expect(mail.subject).to eq(I18n.t('notification_mailer.notify_of_pending_cards.subject'))
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['noreply@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('You have pending cards to review')
    end
  end
end
