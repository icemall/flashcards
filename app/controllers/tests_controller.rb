# frozen_string_literal: true

class TestsController < ApplicationController
  def new
    redirect_to root_path unless FindTestableCard.new(current_user.cards).call.present?
    @test = Test.new(user_id: current_user.id).decorate
  end

  def create
    @test = Test.new(test_params).decorate
    @test.call
    if @test.success
      redirect_to root_path, notice: @test.feedback
    else
      flash.now[:alert] = t(:wrong)
      render :new
    end
  end

  private

  def test_params
    params.require(:test).permit(:card_id, :translated_text).merge(user_id: current_user.id)
  end
end
