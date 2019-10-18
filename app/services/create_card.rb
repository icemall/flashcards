class CreateCard
  def self.call(options)
    card = Card.new(options).tap{ |c| c.review_date = Date.today + 3.days }
  end
end