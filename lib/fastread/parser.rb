require 'fastread/responses/estimated_time_response'
require 'fastread/responses/bad_request_response'
require 'fastread/url_text_analizer'

class Parser
  class << self
    def parse(text)
      url = extract_url(text)
      if url
        EstimatedTimeResponse.new(UrlTextAnalizer.new(url).time_for_text)
      else
        BadRequestResponse.new('Url is not valid')
      end
    end

    private

    def extract_url(text)
      urls = Regexp::PERFECT_URL_PATTERN.match(text)
      urls[0] if urls
    end
  end
end
