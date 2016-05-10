require 'fastread/parser'
require 'fastread/responses/silent_response'

class RequestHandler
  def self.handle(bot, message)
    new(bot, message).handle
  end

  def initialize(bot, message)
    @bot = bot
    @message = message
  end

  def handle
    puts "#{@message.from.first_name}: \'#{message}\'"
    check_request
    send_result
  end

  def message
    if @message.respond_to?(:text)
      @message.text
    else
      @message.query
    end
  end

  private

  def check_request
    case @message
    when Telegram::Bot::Types::Message
      @result = Parser.parse(@message.text)
    when Telegram::Bot::Types::InlineQuery
      @result = SilentResponse.new
      # bot.api.answer_inline_query(inline_query_id: message.id, results: results)
    end
  end

  def send_result
    send_result! if @result.answer?
  end

  def send_result!
    @bot.api.send_message(chat_id: @message.chat.id, text: @result.body)
  end
end
