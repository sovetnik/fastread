require 'fastread/responses/estimated_time_response'
require 'fastread/responses/bad_request_response'
require 'fastread/ripper'

class Parser
  class << self
    def parse(text)
      link = extract_link(text)
      return BadRequestResponse.new('Url is not provided') unless link

      article = extract_article(link)
      return BadRequestResponse.new('Url is not valid') unless article

      EstimatedTimeResponse.new score_time(article)
    end

    private

    def score_time(article, speed: :average)
      article.length / TEXT_READING_SPEED_NORM[speed.to_sym]
    end

    def extract_link(text)
      links = Regexp::PERFECT_URL_PATTERN.match(text)
      links[0] if links
    end

    def extract_article(link)
      Ripper.new(link).extract_article
    end
  end

  TEXT_READING_SPEED_NORM = {
    very_slow: 900,
    slow: 1200,
    average: 1500,
    above_average: 1800,
    fast: 3000,
    very_fast: 5000,
    hyper: 10_000
  }.freeze
end
