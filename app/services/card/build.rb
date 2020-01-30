# frozen_string_literal: true

class Card
  class Build
    def self.call(options)
      Card.new(options).tap { |c| c.review_date = Date.today + 3.days }
    end
  end
end
