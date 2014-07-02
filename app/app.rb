class App < Sinatra::Base

  def initialize
    [9053050, 43730002, 2687742, 152155482, 93522962].each do |id|
      uri = URI("https://api.meetup.com/2/events?&sign=true&member_id=#{id}&key=4d414d6bb7e7f7fb442a717a207f")
      my_hash = JSON.parse(Net::HTTP.get(uri))
      #binding.pry
      my_hash["results"].each do |result|
        event = Event.find_or_create_by(:event_name => result["name"])
        event.date = result["time"]
        event.event_url = result["event_url"]
        event.group_name = result["group"]["name"]
        event.save
      end
    end
  end

end