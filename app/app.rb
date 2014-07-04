require_relative '../config/environment.rb'
require 'pry'
require 'database_cleaner'

class App < Sinatra::Base

  def initialize  
    Group.delete_all
    Event.delete_all
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
    self.class.members
  end

  def self.members
    members_uri ||= URI("https://api.meetup.com/2/members?group_id=14306982&key=4d414d6bb7e7f7fb442a717a207f") 
    # includes Flatiron Presents group id and my api key
    members_hash = JSON.parse(Net::HTTP.get(members_uri))
    members_hash["results"].collect {|result| result["id"] }
  end
end

# App.new