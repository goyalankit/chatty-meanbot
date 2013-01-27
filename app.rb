require 'bundler'
Bundler.require

Dir[File.join(".", "apps/*.rb")].each {|file| require file}

bot = Bot.new(ENV['BOT_USERNAME'], ENV['BOT_PASSWORD'])
puts "**** chatty side of mr Bot is live ****"
bot.listen_for_messages
