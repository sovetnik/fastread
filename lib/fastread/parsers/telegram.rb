require 'readability'
require 'open-uri'
require 'fastread/parser'
require 'fastread/standard_result'
require 'fastread/text_analizer'

class TelegramParser < Parser
  class << self
    def parse(message)
      if valid_url?(message.text)
        begin
          source = open(message.text, "User-Agent" => get_user_agent).read
          content = Readability::Document.new(source).content
          article = content.gsub(/<\/?[^>]+>/, '')[0..4000]
          minutes_for_reading_text = TextAnalizer.time_for_text(article, :average)
          StandardResult.new("#{message.from.first_name}, this link will take #{minutes_for_reading_text} minutes")
        rescue Exception => e
          # OpenURI::HTTPError
          puts e.message
        end
      else
        StandardResult.new("#{message.from.first_name}, i think that was not a valid url =(")
      end
    end

    private

    def valid_url?(text)
      Regexp::PERFECT_URL_PATTERN.match(text)
    end

    def get_user_agent
      "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36"
    end
  end
end
