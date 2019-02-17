require 'countdown_timer'
require 'twitter'
require 'spell_generator'
require_relative 'keys.rb'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = CONSUMER_KEY
  config.consumer_secret     = CONSUMER_SECRET
  config.access_token        = ACCESS_TOKEN
  config.access_token_secret = ACCESS_SECRET
end

# countdown = CountdownTimer::Timer.set_timer(2018, 11, 16)
spell = SpellGenerator::Generator.generate
client.update(spell)
client.search("#ruby").first.text
