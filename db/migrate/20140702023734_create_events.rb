class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string  :date
      t.string  :event_url
      t.string  :event_name
      t.string  :group_name
    end
  end
end

