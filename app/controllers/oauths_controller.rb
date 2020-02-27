# frozen_string_literal: true

class OauthsController < ApplicationController
  skip_before_action :require_login, raise: false

  # sends the user on a trip to the provider,
  # and after authorizing there back to the callback url.
  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    if @user = login_from(provider)
      redirect_to root_path, notice: t('logged_in_using', provider: provider.titleize)
    else
      begin
        @user = create_from(provider)

        reset_session # protect from session fixation attack
        auto_login(@user)
        redirect_to root_path, notice: t('logged_in_using', provider: provider.titleize)
      rescue StandardError
        redirect_to root_path, alert: t('failed_login_using', provider: provider.titleize)
      end
    end
  end
end
