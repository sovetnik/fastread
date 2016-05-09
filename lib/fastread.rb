require 'telegram/bot'
require 'fastread/handler'
require 'fastread/core_ext'

module Fastread
  class Runner
    def self.run
      Telegram::Bot::Client.run(ARGV[0]) do |bot|
        bot.listen { |message| Handler.handle(bot, message) }
      end
    end
  end
end
