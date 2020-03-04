# frozen_string_literal: true

class Card
  class Build
    class << self
      def call(options)
        Card.new(options.merge(defaults))
      end

      private

      def defaults
        {
          leitner_level: Leitner::DEFAULT_LEVEL,
          review_time: Time.now + Leitner::review_period_for_level(Leitner::DEFAULT_LEVEL)
        }
      end
    end
  end
end
