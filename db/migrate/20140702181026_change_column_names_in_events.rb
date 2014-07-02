class ChangeColumnNamesInEvents < ActiveRecord::Migration
  def change
    rename_column(:events, :event_url, :url)
    rename_column(:events, :event_name, :name)
  end
end
