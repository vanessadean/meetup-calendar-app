class ChangeColumnTypeGroupCount < ActiveRecord::Migration
  def change
    change_column(:groups, :count, :integer)
  end
end
