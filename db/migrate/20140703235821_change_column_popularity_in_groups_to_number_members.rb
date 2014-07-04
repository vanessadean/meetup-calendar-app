class ChangeColumnPopularityInGroupsToNumberMembers < ActiveRecord::Migration
  def change
    rename_column(:groups, :popularity, :number_members)
  end
end
