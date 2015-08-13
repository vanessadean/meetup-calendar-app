class Member < ActiveRecord::Base
  has_many  :group_members
  has_many  :groups, :through => :group_members

  def self.get_members_hash
    members_uri = URI("https://api.meetup.com/2/members?group_id=14306982&key=4d414d6bb7e7f7fb442a717a207f")
    @@members_hash = JSON.parse(Net::HTTP.get(members_uri))
    @@i = 0
  end
end