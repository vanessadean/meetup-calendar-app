class App < Sinatra::Base

  def initialize
    # members_uri ||= URI("https://api.meetup.com/2/members?group_id=14306982&key=4d414d6bb7e7f7fb442a717a207f") # includes Flatiron Presents group id and my api key
    # members_hash = JSON.parse(Net::HTTP.get(members_uri))
    # @members = []
    # members_hash["results"].each do |result|
    #   @members << result["id"]
    # end

    [9053050, 43730002, 2687742, 152155482, 93522962].each do |id|
      uri = URI("https://api.meetup.com/2/events?&sign=true&member_id=#{id}&key=4d414d6bb7e7f7fb442a717a207f")
      my_hash = JSON.parse(Net::HTTP.get(uri))
      
      my_hash["results"].each do |result|
        event = Event.find_or_create_by(:name => result["name"])
        event.date ||= result["time"]
        event.url ||= result["event_url"]
        event.save
        
        event.group = Group.find_or_create_by(:name => result["group"]["name"])
        event.group.count ||= 0
        event.group.count += 1
        event.group.color ||= rand(255)
        event.group.save

        #binding.pry
      end
    end
  end

end

# pull dynamic member list 
# request with Flatiron Presents group id with https://api.meetup.com/2/members?group_id=14306982&key=4d414d6bb7e7f7fb442a717a207f

