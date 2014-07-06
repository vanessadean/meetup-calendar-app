require_relative '../config/environment.rb'

class App < Sinatra::Base

  def initialize  
    Event.delete_all
    Group.delete_all
    Member.delete_all
    GroupMember.delete_all
    self.class.members
  end

  def self.members
    # get all members of Flatiron Presents
    members_uri ||= URI("https://api.meetup.com/2/members?group_id=14306982&key=4d414d6bb7e7f7fb442a717a207f") 
    # includes Flatiron Presents group id and api key

    # for each member, create a new instance of Member
    # and assign meetup_id to the primary identifier given by the meetup API
    members_hash = JSON.parse(Net::HTTP.get(members_uri))
    members_hash["results"].each { |result| Member.create(:meetup_id => result["id"]) }
  end
end
