ENV['SINATRA_ENV'] ||= "development"

require 'net/http'
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection('postgres://localhost/project')

require_all 'app'

