require 'bundler'
Bundler.require

require 'socket'

Dir[File.join(".", "apps/*.rb")].each {|file| require file}

ds = UDPSocket.new
ds.bind(nil, ENV['PORT'])

bot = Bot.new(ENV['BOT_USERNAME'], ENV['BOT_PASSWORD'])
puts "**** chatty side of mr Bot is live ****"
bot.status("@_goyalankit at twitter.com")
bot.listen_for_messages
