class DeleteNumberMembersInEvents < ActiveRecord::Migration
  def change
    remove_column(:events, :number_members, :integer)
  end
end
