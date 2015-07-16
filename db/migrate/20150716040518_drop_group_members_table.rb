class DropGroupMembersTable < ActiveRecord::Migration
  def change
    drop_table :group_members
  end
end
