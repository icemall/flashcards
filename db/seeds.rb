# frozen_string_literal: true

# parse DE->EN translations for card seeds
require 'open-uri'
TRANSLATIONS_URL = 'http://1000mostcommonwords.com/1000-most-common-german-words/'
page = Nokogiri::HTML(open(TRANSLATIONS_URL))
cards = []
page.css('tr').each_with_index do |row, i|
  next if i.zero? # skip header

  card = {}
  card[:original_text] = row.css('td')[1].text
  card[:translated_text] = row.css('td')[2].text
  card[:review_date] = Date.today
  cards << card
end
cards.each do |card|
  CreateCard.call(card).save
end