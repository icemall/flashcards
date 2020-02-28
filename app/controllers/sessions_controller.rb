# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def create
    @user = login(session_params[:email], session_params[:password])
    if @user
      redirect_back_or_to(root_path, notice: t('login_successfull'))
    else
      flash.now[:alert] = t('login_failed')
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: t('logged_out'))
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
