# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :require_login

  private

  def not_authenticated
    redirect_to login_path, alert: t('please_login_first')
  end

  def set_locale
    I18n.locale = if current_user.present?
                    current_user.locale || browser_language
                  elsif locale_param_present?
                    params[:locale]&.to_sym
                  else
                    browser_language
                  end
  end

  def browser_language
    http_accept_language.compatible_language_from(I18n.available_locales)
  end

  def locale_param_present?
    params[:locale] && (params[:locale].to_sym.in? I18n.available_locales)
  end
end
