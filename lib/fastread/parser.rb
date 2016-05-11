require 'fastread/responses/estimated_time_response'
require 'fastread/responses/bad_request_response'
require 'fastread/ripper'

class Parser
  class << self
    def parse(text)
      url = extract_url(text)
      return BadRequestResponse.new('Url is not provided') unless url

      article = extract_article(url)
      return BadRequestResponse.new('Url is not valid') unless article

      EstimatedTimeResponse.new score_time(article)
    end

    private

    def score_time(article, speed: :average)
      article.length / ReadingSpeed::TEXT_READING_SPEED_NORM[speed.to_sym]
    end

    def extract_url(text)
      urls = Regexp::PERFECT_URL_PATTERN.match(text)
      urls[0] if urls
    end

    def extract_article(url)
      Ripper.new(url).extract_article
    end
  end
end
