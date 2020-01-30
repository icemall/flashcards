# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    redirect_to new_test_path if Card.to_test.any?
  end
end
