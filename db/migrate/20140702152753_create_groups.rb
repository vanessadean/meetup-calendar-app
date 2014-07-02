class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string  :name
      t.string  :color
      t.string  :count
    end
  end
end
