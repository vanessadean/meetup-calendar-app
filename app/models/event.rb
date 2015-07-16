class Event < ActiveRecord::Base
  belongs_to  :group

  # use Flatiron Presents members as a starting seed
  # and get the other events that they are members of 
  def self.more
    if App.count < App.members_hash.length
      @member_ids = App.members_hash["results"][App.count...(App.count+5)].collect { |result| result["id"] }
    end
    App.count += 5
    @member_ids.each do |member_id|
      uri = URI("https://api.meetup.com/2/events?&sign=true&photo-host=public&member_id=#{member_id}&time=#{App.time_now},%20#{(App.time_now+604800000).to_s}&page=20&key=4d414d6bb7e7f7fb442a717a207f")
      
      my_hash = JSON.parse(Net::HTTP.get(uri))

      my_hash["results"].each do |result|
        # create the event if not exists
        event = self.find_or_create_by(
          :name => result["name"], 
          :date => result["time"]/1000, 
          :url => result["event_url"]) 
        event.assign_date(Time.at(event.date.to_i).to_date)

        # create the group if not exists, and assign it to the event
        group = Group.find_or_create_by(
          :name => result["group"]["name"], 
          :urlname => result["group"]["urlname"])
        group.assign_color
        group.members = group.members + 1

        event.group = group
        event.save
      end
    end
  end

  def assign_date(new_date)
    self.event_date = new_date.strftime("%A, %B %d, %Y")
  end  
end