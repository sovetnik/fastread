require 'fastread/ripper'

class UrlTextAnalizer
  TEXT_READING_SPEED_NORM = {
    very_slow: 900,
    slow: 1200,
    average: 1500,
    above_average: 1800,
    fast: 3000,
    very_fast: 5000,
    hyper: 10000
  }.freeze

  def initialize(url)
    @url = url
  end

  def time_for_text(speed: :average)
    Ripper.new(@url).extract_article.length / TEXT_READING_SPEED_NORM[speed.to_sym]
  end
end
