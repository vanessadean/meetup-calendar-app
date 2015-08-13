require_relative '../config/environment.rb'

class App < Sinatra::Base
  def initialize
    Group.destroy_all
    Event.destroy_all
    members_uri = URI("https://api.meetup.com/2/members?group_id=14306982&key=4d414d6bb7e7f7fb442a717a207f")
    @@members_hash = JSON.parse(Net::HTTP.get(members_uri))
    @@index = 0
  end

  def self.time_now
    DateTime.now.strftime('%Q').to_i
  end

  def self.members_hash
    @@members_hash["results"]
  end

  def self.member_index_counter
    @@index
  end

  def self.uptick_member_index_counter
    @@index += 5
  end
end
