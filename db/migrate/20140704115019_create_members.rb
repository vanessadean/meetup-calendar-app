class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer    :meetup_id
    end
  end
end
