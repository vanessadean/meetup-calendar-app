class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer  :time
      t.string  :url
      t.string  :name
      t.integer :group_id
      t.date :date
      t.integer :popularity, default: 0
    end
  end
end

