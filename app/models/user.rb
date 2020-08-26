# frozen_string_literal: true

class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :email, :password, presence: true
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  has_many :decks, dependent: :destroy
  has_many :cards, through: :decks

  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  scope :with_pending_cards, -> { joins(:cards).merge(Card.testable).distinct }
end
