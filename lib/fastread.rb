require 'telegram/bot'
require 'fastread/core_ext'
require 'fastread/request_handler'

module Fastread
  class Runner
    def self.run
      Telegram::Bot::Client.run(ARGV[0]) do |bot|
        bot.listen { |message| RequestHandler.handle(bot, message) }
      end
    end
  end
end
