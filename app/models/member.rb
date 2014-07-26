class Member < ActiveRecord::Base
  has_many  :group_members
  has_many  :groups, :through => :group_members

  def self.get_members_hash
    members_uri = URI("https://api.meetup.com/2/members?group_id=14306982&key=4d414d6bb7e7f7fb442a717a207f") 
    @@members_hash = JSON.parse(Net::HTTP.get(members_uri))
    @@i = 0
  end

  def self.get_members
    members_hash = @@members_hash["results"]
    if @@i < members_hash.length
      members_hash[@@i..(@@i+2)].each { |result| Member.find_or_create_by(:meetup_id => result["id"]) }
    end
    @@i += 3
  end
end