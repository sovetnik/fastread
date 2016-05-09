require 'readability'
require 'open-uri'
require 'fastread/parser'
require 'fastread/results/standard_result'
require 'fastread/results/invalid_result'

class UrlParser < Parser
  class << self
    def parse(text)
      url = extract_url(text)
      url ? extract_article(url[0]) : InvalidResult.new("Url is not valid")
    end

    private

    def extract_article(link)
      begin
        web_page = open(link, "User-Agent" => get_user_agent).read
        content = Readability::Document.new(web_page).content
        article = content.gsub(/<\/?[^>]+>/, '')
        StandardResult.new(article)
      rescue Exception => e
        # OpenURI::HTTPError
        puts e.message
      end
    end

    def extract_url(text)
      Regexp::PERFECT_URL_PATTERN.match(text)
    end

    def get_user_agent
      "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36"
    end
  end
end
