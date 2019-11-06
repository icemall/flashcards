# frozen_string_literal: true

require "#{Rails.root}/lib/api/card_parser"
Api::CardParser.call.each do |card|
  card = CreateCard.call(card)
  card.save! if card.valid?
end
