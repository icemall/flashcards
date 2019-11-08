class TestsController < ApplicationController

  def index
    redirect_to new_test_path
  end

  def new
    redirect_to root_path unless Card.to_test.any?
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    @test.process
    if @test.success
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