class AddNumberMembersToEvents < ActiveRecord::Migration
  def change
    add_column :events, :number_members, :integer
  end
end
