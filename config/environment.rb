ENV['SINATRA_ENV'] ||= "development"

require 'net/http'
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection('postgres://qbgnzmttolseof:32rlZpsC_1CmAhgeqtWb-Unmp-@ec2-54-225-168-181.compute-1.amazonaws.com:5432/dch7lkfh9f4rio')

require_all 'app'

