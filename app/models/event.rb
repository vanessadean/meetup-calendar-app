class Event < ActiveRecord::Base
  belongs_to  :group

  # use Flatiron Presents members as a starting seed
  # and get the other events that they are members of
  def self.get_events
    members_hash = App.members_hash
    index = App.member_index_counter
    index+5 > members_hash.length ? max = members_hash.length : max = index+5
    members_hash[index...max].each do |member|
      uri = URI("https://api.meetup.com/2/events?&sign=true&photo-host=public&member_id=#{member["id"]}&time=#{App.time_now},%20#{(App.time_now+604800000).to_s}&page=20&key=4d414d6bb7e7f7fb442a717a207f")

      events = JSON.parse(Net::HTTP.get(uri))

      events["results"].each do |result|
        # create the event if not exists
        event = self.find_or_create_by(
          :name => result["name"],
          :time => result["time"]/1000,
          :url => result["event_url"])

        # create the group if not exists, and assign it to the event
        event.group = Group.find_or_create_by(
          :name => result["group"]["name"],
          :urlname => result["group"]["urlname"])

        # assign the group color
        event.group.assign_color

        # add member to the group
        event.popularity += 1

        # add the event date
        event.date = Time.at(result["time"]/1000).to_date

        event.save
      end
    end
    App.uptick_member_index_counter
  end

  def font_size
    if popularity < 3
      20
    elsif popularity > 15
      40
    else
      28
    end
  end
end