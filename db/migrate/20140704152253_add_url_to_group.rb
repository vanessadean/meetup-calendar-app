class AddUrlToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :urlname, :string
  end
end
