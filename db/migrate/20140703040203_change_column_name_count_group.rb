class ChangeColumnNameCountGroup < ActiveRecord::Migration
  def change
    rename_column(:groups, :count, :popularity)
  end
end
