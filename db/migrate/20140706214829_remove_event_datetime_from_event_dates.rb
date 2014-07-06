class RemoveEventDatetimeFromEventDates < ActiveRecord::Migration
  def change
    remove_column :event_dates, :event_datetime
  end
end
