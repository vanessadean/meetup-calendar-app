class RemoveNumberMembersColumn < ActiveRecord::Migration
  def change
    remove_column(:groups, :number_members, :integer)
  end
end
