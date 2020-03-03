class Deck < ApplicationRecord
  belongs_to :user
  has_many :cards

  validates :current, uniqueness: true, if: :current
  validates :user_id, :name, presence: true

  scope :current, -> { where(current: true).any? ? where(current: true) : all }
end
