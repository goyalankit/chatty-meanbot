chatty-meanbot
==============

A jabber client bot.
----------------------

meet <strong>Mr. chatty meanbot</strong>

Chatty Meanbot is a jabber client that basically sits in your gtalk or whatever client you use for chat. It provides answers to several type of queries.

To run this client you'll need following things:

* Wordnik api key, get it from http://developer.wordnik.com
* Bitly Auth Token, get it from https://bitly.com/a/oauth_apps
* Gmail id with credentials

<strong>Usage:</strong>

You need to export some environment variables, in order to access external apis used.

    export WORDNIK_API_KEY=YOUR_WORDNIK_API_KEY
    export BITLY_AUTH_TOKEN=YOU_BITLY_AUTH_TOKEN
    export BOT_USERNAME=YOU@GMAIL.COM
    export BOT_PASSWORD=**********
    
Now simply run:

    ruby app.rb

There's another branch called <code>heroku-deployable</code>, which makes it a sinatra application, ready for deployment on heroku.

CAUTION - It's a hack and a really bad way to deloy.

Available Commands:

- ping
- define <word> - get definition of a dictonary word.
- use <word> - usage of a given word.
- shorten <long url> - short bit.ly url.
- last_tweet_for <scree name> - last tweet of given user.
- let_me_google <word> - let me google it for you animation link for given word.
- commit_message - random commmit message from whatthecommit.com
- help

for more information, visit: http://goyalankit.com
follow me on twitter, http://twitter.com/_goyalankit
