class ProcessMessage
  def initialize message
    @message = message
  end

  def response
    mp = @message.body.split
    send(mp[0].downcase, mp[1..-1].first)
  end


  def method_missing(m, *args)  
    "don't know how to perform this action, type help for options"
  end  

  def last_tweet_for screen_name
    return "Format: last_tweet <screen name> Result: get last tweet of given user" if screen_name.blank?
    response = Faraday.get("http://api.twitter.com/1/statuses/user_timeline.json?screen_name=#{screen_name}&count=1&trim_user=true")
    result   = JSON.parse(response.body)
    (response.status == 200 and !result.blank?) ? result.first["text"] : "most probably user doesn't exist or hasn't tweeted yet."
  end

  def ping test
    'pong'
  end

  #def imagify keyword
    #response = Faraday.get('http://metaatem.net/spell.php?picsize=t&string=lala')
    #response.body
  #end

  def define keyword
    return "Format: define <word> Result: get definition of your word" if keyword.blank?    
    results =  Wordnik.word.get_definitions(keyword, :use_canonical => true, :limit => 4, :source_dictionaries => 'all').collect{|i| i["text"] if i["text"].length < 100}.compact
    results.blank? ? "I don't understand this word." : results.first 
  end

  def use keyword
    return "Format: use <word> Result: get example sentences for your word" if keyword.blank?
    results = Wordnik.word.get_examples(keyword, :limit => 1)["examples"].collect { |i| i["text"]  }
    results.blank? ? "something went wrong...please try after some time" : results
  end

  def let_me_google keyword
    return "Format: let_me_google <word> Result: get let me google it for you animation link" if keyword.blank?
    "http://lmgtfy.com/?q=#{keyword}"
  end

  def commit_message dummy
    response = Faraday.get('http://whatthecommit.com/index.txt')
    response.status == 200 ? response.body : "something went wrong.."
  end

  def shorten long_url
    return "Format: shorten <url> Result: get bit.ly url for your long url" if long_url.blank?
    encoded_long_url = URI::encode(long_url.strip.gsub(/\/*\?/,'/?'))
    response = Faraday.get("https://api-ssl.bitly.com/v3/shorten?access_token=#{BITLY_AUTH_TOKEN}&longUrl=#{encoded_long_url}&format=txt")
    response.status == 200 ? response.body : "invalid url. try again with some other url"
  end

  def about dummy
    return "created by Ankit Goyal. @_goyalankit at Twitter. source code available at: https://github.com/ankitunique/chatty-meanbot"
  end

  def help args
    return send(args.first, nil) unless args.blank?
    return "Available commands are ping, define, use, shorten, last_tweet_for, let_me_google, commit_message\n type help <command name to get info about a command>"
  end
end
