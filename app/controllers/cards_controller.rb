# frozen_string_literal: true

class CardsController < ApplicationController
  before_action :set_card, only: %i[edit update destroy]

  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    @card = CreateCard.call(card_params)
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
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date)
  end
end
