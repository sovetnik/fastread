require 'fastread/results/invalid_result'
require 'fastread/results/standard_result'

class Parser
  class << self
    def parse(text)
      extracted_url = extract_url(text)
      if extracted_url
        StandardResult.new(extracted_url)
      else
        InvalidResult.new('Url is not valid')
      end
    end

    private

    def extract_url(text)
      urls = Regexp::PERFECT_URL_PATTERN.match(text)
      urls[0] if urls
    end
  end
end
