require_relative '../config/environment.rb'

class App < Sinatra::Base
  def initialize
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

  def self.get_events
    members_hash = App.members_hash
    index = App.member_index_counter
    index+5 > members_hash.length ? max = members_hash.length : max = index+5
    members_hash[index...max].each do |member|
      uri = URI("https://api.meetup.com/2/events?&sign=true&photo-host=public&member_id=#{member["id"]}&time=#{App.time_now},%20#{(App.time_now+604800000).to_s}&page=20&key=4d414d6bb7e7f7fb442a717a207f")

      events = JSON.parse(Net::HTTP.get(uri))

      events["results"].each do |result|
        # create the event if not exists
        event = Event.find_or_create_by(result["id"], result["name"], result["time"]/1000, result["event_url"])

        # create the group if not exists, and assign it to the event
        event.group = Group.find_or_create_by(result["group"]["id"], result["group"]["name"], result["group"]["urlname"])

        # assign the group color
        event.group.assign_color

        # add member to the group
        event.popularity += 1

        # add the event date
        event.date = Time.at(result["time"]/1000).to_date
      end
    end
    App.uptick_member_index_counter
  end
end
