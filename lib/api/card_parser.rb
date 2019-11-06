module Api
  class CardParser
    def self.call
      # parse DE->EN translations for card seeds
      require 'open-uri'
      translations_url = 'http://1000mostcommonwords.com/1000-most-common-german-words/'
      page = Nokogiri::HTML(open(translations_url))
      cards = []
      page.css('tr').each_with_index do |row, i|
        next if i.zero? # skip header

        card = {}
        card[:original_text] = row.css('td')[1].text
        card[:translated_text] = row.css('td')[2].text
        card[:review_date] = Date.today
        cards << card
      end
      cards
    end
  end
end