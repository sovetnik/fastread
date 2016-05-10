require 'fastread/parser'
require 'fastread/result'

class Handler
  def self.handle(bot, message)
    new(bot, message).handle
  end

  attr_reader :bot, :message, :result

  def initialize(bot, message)
    @bot = bot
    @message = message
  end

  def handle
    puts "#{message.from.first_name}: \'#{message.text}\'"
    set_result
    try_send_result
  end

  private

  def set_result
    case message
    when Telegram::Bot::Types::Message
      @result = Parser.parse(message.text)
    when Telegram::Bot::Types::InlineQuery
      @result = Result.new
      # bot.api.answer_inline_query(inline_query_id: message.id, results: results)
    end
  end

  def try_send_result
    send_result! if result.valid? && result.answer?
  end

  def send_result!
    bot.api.send_message(chat_id: message.chat.id, text: result.body)
  end
end
