class Event < ActiveRecord::Base
  belongs_to  :group

  def self.more
    Member.all.sample(3).each do |member|
      uri = URI("https://api.meetup.com/2/events?&sign=true&photo-host=public&member_id=#{member.meetup_id}&time=1404858600000,%201405463400000&page=20&key=4d414d6bb7e7f7fb442a717a207f")
      # includes member id, time of one week and API key 

      my_hash = JSON.parse(Net::HTTP.get(uri))

      my_hash["results"].each do |result|
        event = self.find_or_create_by(:name => result["name"], :date => result["time"], :url => result["event_url"]) 
        event.group = Group.find_or_create_by(:name => result["group"]["name"], :urlname => result["group"]["urlname"])
        event.group.color ||= event.group.assign_color
        event.group.members << member unless event.group.members.include?(member)
        event.save
      end
    end
  end
end

# the first five members
# [9053050, 43730002, 2687742, 152155482, 93522962]