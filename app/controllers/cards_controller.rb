# frozen_string_literal: true

class CardsController < ApplicationController
  before_action :set_card, only: %i[edit update destroy]

  def index
    @cards = current_user.cards.all
  end

  def new
    @card = current_user.cards.build
  end

  def create
    @card = Card::Build.call(card_params)
    if @card.save
      redirect_to cards_path, notice: t('card_successfuly_created')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @card.update(card_params)
      redirect_to cards_path
    else
      render :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to cards_path
  end

  private

  def set_card
    @card = current_user.cards.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date).merge(user_id: current_user.id)
  end
end
