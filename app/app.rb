require 'database_cleaner'

class App < Sinatra::Base

  def initialize
    Group.delete_all
    Event.delete_all
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean

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
        event = Event.create(:name => result["name"])
        event.date = result["time"]
        event.url = result["event_url"]
        event.group = Group.find_or_create_by(:name => result["group"]["name"])
        # event.group.popularity ||= 0
        # event.group.popularity += 1
        event.save
      end

      Group.assign_colors
      Group.get_popularity

      # Group.all.each do |group|
      #   group.color ||= "#{rand(255)},#{rand(255)},#{rand(255)}"
      #   group.save
      # end

      # Event.all.each do |event|
      #   group = Group.find_by(:id => event.group_id)
      #   group.popularity ||= 0
      #   group.popularity += 1
      #   group.save
      # end
    end
  end

end

