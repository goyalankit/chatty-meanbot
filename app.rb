require 'bundler'
Bundler.require

Dir[File.join(".", "apps/*.rb")].each {|file| require file}

get '/start-chatty-bot' do
  job1 = fork do
    bot = Bot.new(ENV['BOT_USERNAME'], ENV['BOT_PASSWORD'])
    puts "**** chatty side of mr Bot is live ****"
    bot.status(params[:message] || "@_goyalankit at twitter.com")
    bot.listen_for_messages
  end

  Process.detach(job1)
  body "process started at #{Time.now}"
end

get '/ping' do
  "App running at #{Time.now}"
end
