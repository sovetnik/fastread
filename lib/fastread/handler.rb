require 'fastread/parsers/telegram'

class Handler
  def self.handle(bot, message)
    new(bot, message).handle
  end

  attr_reader :bot, :message

  def initialize(bot, message)
    @bot = bot
    @message = message
  end

  def handle
    case message.text
    when '/start'
      start
      p 'chat started'
    when '/stop'
      stop
      p 'chat stopped'
    else
      parse
      p 'message parsed'
    end
  end

  private

  def start
    bot.api.send_message(
      chat_id: message.chat.id,
      text: "Hello, #{message.from.first_name}"
    )
  end

  def stop
    bot.api.send_message(
      chat_id: message.chat.id,
      text: "Fuck off, #{message.from.first_name}"
    )
  end

  def parse
    p ('Need Parse: ' + message.text)
    result = TelegramParser.parse(message)
    if result.answer_to_user?
      bot.api.send_message(chat_id: message.chat.id, text: result.body)
    end
  end
end
