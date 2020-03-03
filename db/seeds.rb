# frozen_string_literal: true

require "#{Rails.root}/lib/api/card_parser"

ActiveRecord::Base.transaction do
  user = User.create!(email: 'admin@example.com', password: '123qwe', password_confirmation: '123qwe')

  deck = user.decks.create!(name: 'Default', current: true)

  Api::CardParser.call.each do |card|
    card = Card::Build.call(card)
    card.deck = deck
    card.save! if card.valid?
  end
end
