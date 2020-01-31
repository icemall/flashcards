# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, :password, presence: true

  has_many :cards
end
