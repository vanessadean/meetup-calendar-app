class Event < ActiveRecord::Base
  belongs_to  :group

  def self.more
    App.members.sample(5).each do |id|
      uri = URI("https://api.meetup.com/2/events?&sign=true&photo-host=public&member_id=#{id}&time=1404858600000,%201405463400000&page=20&key=4d414d6bb7e7f7fb442a717a207f")
      my_hash = JSON.parse(Net::HTTP.get(uri))

      my_hash["results"].each do |result|
        event = self.find_or_create_by(:name => result["name"], :date => result["time"], :url => result["event_url"]) 
        event.group = Group.find_or_create_by(:name => result["group"]["name"])
        event.group.color ||= event.group.assign_color
        event.group.get_members
        event.save
      end
    end
  end
end