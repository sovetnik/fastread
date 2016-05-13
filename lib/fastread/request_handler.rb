require 'fastread/parser'
require 'fastread/responses/silent_response'
require 'fastread/responses/text_response'

class RequestHandler
  def self.handle(bot, message)
    new(bot, message).handle
  end

  def initialize(bot, message)
    @bot = bot
    @message = message
  end

  def handle
    puts "#{@message.from.first_name}: \'#{@message}\'"
    @result = case_request
    send_result
  end

  private

  def case_request
    case @message.text
    when '/start'
      TextResponse.new(:start, @message.from.first_name)
    when '/help'
      TextResponse.new(:help, @message.from.first_name)
    when '/who'
      TextResponse.new(:who, @message.from.first_name)
    when /^\/read.*/
      Parser.parse(@message.text)
    else
      Parser.parse(@message.text)
    end
  end

  def send_result
    send_result! if @result.answer?
  end

  def send_result!
    @bot.api.send_message(chat_id: @message.chat.id, text: @result.body)
  end
end
