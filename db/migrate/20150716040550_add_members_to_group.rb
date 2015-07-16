class AddMembersToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :members, :integer, default: 0
  end
end
