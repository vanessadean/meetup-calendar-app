class Event < ActiveRecord::Base
  belongs_to  :group
  belongs_to  :event_date

  # use Flatiron Presents members as a starting seed
  # and get the other events that they are members of
  def self.get_events
    members_hash = @@members_hash["results"]
    members_hash[@@i...(@@i+5)].each do |member|
      uri = URI("https://api.meetup.com/2/events?&sign=true&photo-host=public&member_id=#{member.meetup_id}&time=#{App.time_now},%20#{(App.time_now+604800000).to_s}&page=20&key=4d414d6bb7e7f7fb442a717a207f")

      events = JSON.parse(Net::HTTP.get(uri))

      events["results"].each do |result|
        # create the event if not exists
        event = self.find_or_create_by(
          :name => result["name"],
          :date => result["time"]/1000,
          :url => result["event_url"])

        # create the group if not exists, and assign it to the event
        event.group = Group.find_or_create_by(
          :name => result["group"]["name"],
          :urlname => result["group"]["urlname"])

        # assign the group color
        event.group.assign_color

        # tally up the number of members
        event.group.members += 1

        # add the event date
        event.assign_date(Time.at(event.date.to_i).to_date)

        event.save
      end
    end
    @@i += 5
  end

  def assign_date(new_date)
    self.event_date = EventDate.find_or_create_by(event_date: new_date)
  end
end