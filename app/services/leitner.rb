# frozen_string_literal: true

# Leitner system variables
class Leitner
  DEFAULT_LEVEL = 0
  MAX_ACCEPTABLE_ATTEMPTS = 3
  ROLLBACK_LEVEL = 1

  def self.review_period_for_level(level)
    return unless level.is_a?(Integer) && !level.negative?

    case level
    when 0
      0.seconds
    when 1
      12.hours
    when 2
      3.days
    when 3
      1.week
    when 4
      2.weeks
    else
      1.month
    end
  end
end
