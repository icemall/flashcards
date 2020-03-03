# frozen_string_literal: true

class CardsController < ApplicationController
  before_action :set_card, only: %i[edit update destroy]

  def index
    @cards = current_user.cards
  end

  def new
    @card = current_user.cards.build.decorate
  end

  def create
    @card = Card::Build.call(card_params)
    if @card.save
      redirect_to cards_path, notice: t('successfuly_created', resource: Card.model_name.human)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @card.update(card_params)
      redirect_to cards_path
    else
      render :edit.c
    end
  end

  def destroy
    @card.destroy
    redirect_to cards_path
  end

  private

  def set_card
    @card = current_user.cards.find(params[:id]).decorate
  end

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date, :picture, :remote_picture_url, :deck_id)
  end
end
