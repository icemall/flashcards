# frozen_string_literal: true

module CardHelper
  def normalize_card_text(string)
    return unless string

    string.strip.downcase
  end
end
