class CreateCard
  def self.call(options)
    card = Card.new(options)
    card.review_date = Date.today + 3.days
    card
  end
end