# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    redirect_to new_test_path if FindTestableCard.new(current_user.cards).call
  end
end
