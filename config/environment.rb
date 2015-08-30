ENV['SINATRA_ENV'] ||= "development"

require 'net/http'
require 'bundler'
Bundler.require

require_all 'app'
