class Deck < ApplicationRecord
  belongs_to :user
  has_many :cards

  validates :current, uniqueness: true, if: :current
  validates :name, presence: true

  def self.to_test
    where(current: true).any? ? where(current: true) : all
  end
end
