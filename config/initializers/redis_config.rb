require 'redis'
require 'json'

$redis = Redis.new(url: ENV['URL_LOCKBOX_REDIS'])
