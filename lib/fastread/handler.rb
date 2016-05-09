require 'fastread/parsers/url_parser'
require 'fastread/text_analizer'

class Handler
  def self.handle(bot, message)
    new(bot, message).handle
  end

  attr_reader :bot, :message, :article

  def initialize(bot, message)
    @bot = bot
    @message = message
  end

  def handle
    @article = case message
                when Telegram::Bot::Types::Message
                  puts "#{message.from.first_name}: \"#{message.text}\""
                  UrlParser.parse(message.text)
                # when Telegram::Bot::Types::InlineQuery
                  # bot.api.answer_inline_query(inline_query_id: message.id, results: results)
                end

    if article.valid? && article.answer?
      minutes_for_reading_text = TextAnalizer.time_for_text(article.body, :average)
      text = "#{message.from.first_name}, this link will take #{minutes_for_reading_text} minutes"
      bot.api.send_message(chat_id: message.chat.id, text: text)
    end
  end
end
