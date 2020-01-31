# frozen_string_literal: true

require "#{Rails.root}/lib/api/card_parser"

user = User.create!(email: 'admin@example.com', password: '123qweASD')

Api::CardParser.call.each do |card|
  card = Card::Build.call(card)
  card.user = user
  card.save! if card.valid?
end
