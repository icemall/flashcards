# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  skip_before_action :require_login, only: %i[new create]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    if @user.save
      auto_login(@user)
      redirect_to root_path, notice: t('successfully_created', resource: User.model_name.human)
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: t('successfully_updated', resource: User.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: t('successfully_destroyed', resource: User.model_name.human)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
