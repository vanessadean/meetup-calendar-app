class CreateEventDates < ActiveRecord::Migration
  def change
    create_table :event_dates do |t|
      t.date :event_date
    end 
  end
end
