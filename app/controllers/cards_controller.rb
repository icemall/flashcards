# frozen_string_literal: true

class CardsController < ApplicationController
  before_action :set_card, only: [:edit, :update, :destroy]

  def index
    @cards = Card.all
  end

  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to cards_path
    else
      render :edit
    end
  end

  def destroy
    if @card.destroy
      redirect_to cards_path
    else
      render :edit
    end
  end

  private
  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit!
  end
end
