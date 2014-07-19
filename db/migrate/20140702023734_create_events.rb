class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer  :date
      t.string  :url
      t.string  :name
      t.integer :group_id
      t.integer :event_date_id
    end
  end
end

