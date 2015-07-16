class ChangeEventsEventDate < ActiveRecord::Migration
  def change
    add_column :events, :event_date, :string
    remove_column :events, :event_date_id, :integer
  end
end
