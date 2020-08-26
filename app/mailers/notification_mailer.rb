# frozen_string_literal: true

# any notification mailer
class NotificationMailer < ApplicationMailer
  def notify_of_pending_cards(user)
    @url = Settings.root_url
    mail(to: user.email, subject: default_i18n_subject)
  end
end
