require 'telegram/bot'
require 'fastread/core_ext'
require 'fastread/request_handler'

module Fastread
  class Runner
    def self.run
      Telegram::Bot::Client.run(ARGV[0]) do |bot|
        bot.listen do |message|
          case message
          when Telegram::Bot::Types::Message
            RequestHandler.handle(bot, message)
          when Telegram::Bot::Types::CallbackQuery
            # InlineHandler.handle(bot, message)
          end
        end
      end
    end
  end
end
