class AddEventDateIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_date_id, :integer
  end
end
