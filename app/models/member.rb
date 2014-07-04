class Member < ActiveRecord::Base
  has_many  :group_members
  has_many  :groups, :through => :group_members
end