class RemoveColumnFromEvents < ActiveRecord::Migration
  def change
    remove_column(:events, :group_name, :string)
  end
end
