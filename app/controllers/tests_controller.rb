# frozen_string_literal: true

class TestsController < ApplicationController
  def new
    redirect_to root_path unless Card.to_test.any?
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.call.success
      redirect_to root_path, notice: t(:correct)
    else
      flash.now[:alert] = t(:wrong)
      render :new
    end
  end

  private

  def test_params
    params.require(:test).permit(:card_id, :translated_text)
  end
end
