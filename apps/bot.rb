require 'bundler'
Bundler.require

class Bot 
  def initialize username, password
    @chatty_meanbot = Jabber::Simple.new(username, password)
  end

  def deliver email, message
    @chatty_meanbot.deliver email, message
  end

  def status message
    @chatty_meanbot.status(:chat,"hey people")
  end

  def email message
    message.from.node + "@" + message.from.domain
  end


  def listen_for_messages
    while true do
      @chatty_meanbot.received_messages do |msg|
        pm = ProcessMessage.new(msg)
        deliver(email(msg), pm.response)
      end
    end
  end
end
