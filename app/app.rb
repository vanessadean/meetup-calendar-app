require_relative '../config/environment.rb'

class App < Sinatra::Base
  def initialize 
    @@time_now_in_milliseconds = DateTime.now.strftime('%Q').to_i
    @@count = 0
    flatiron_members_uri = URI("https://api.meetup.com/2/members?group_id=14306982&key=4d414d6bb7e7f7fb442a717a207f") 
    @@members_hash = JSON.parse(Net::HTTP.get(flatiron_members_uri))
  end

  def self.time_now
    @@time_now_in_milliseconds
  end

  def self.members_hash
    @@members_hash
  end

  def self.count
    @@count
  end

  def self.count=(number)
    @@count = number
  end
end
