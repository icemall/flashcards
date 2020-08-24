# frozen_string_literal: true

class Card
  class Build
    include CardHelper

    class << self
      def call(options)
        Card.new(defaults.merge(options))
      end

      private

      def defaults
        {
          leitner_level: Leitner::DEFAULT_LEVEL,
          review_time: Time.now + Leitner.review_period_for_level(Leitner::DEFAULT_LEVEL)
        }
      end
    end
  end
end
