Wordnik.configure do |config|
  config.api_key = ENV['WORDNIK_API_KEY']
end

BITLY_AUTH_TOKEN = ENV['BITLY_AUTH_TOKEN']

$logger = Logger.new('log.txt')
def logger message, type="info"
  type =='info' ? $logger.info(message) : $logger.error(message)
end
