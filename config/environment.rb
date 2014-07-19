ENV['SINATRA_ENV'] ||= "development"

require 'net/http'
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection('postgres://dqsavrsbkskmji:FTd8XFQ5qLxHdLrqeVlUgVJ9Zv@ec2-174-129-218-200.compute-1.amazonaws.com:5432/ddbicalf945n8')

require_all 'app'

