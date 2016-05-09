class TextAnalizer
  TEXT_READING_SPEED_NORM = {
    very_slow: 900,
    slow: 1200,
    average: 1500,
    above_average: 1800,
    fast: 3000,
    very_fast: 5000,
    hyper: 10000
  }.freeze

  class << self
    def time_for_text(text, speed)
      text.length / TEXT_READING_SPEED_NORM[speed.to_sym]
    end
  end
end
