class AddDefaultToListsCompleted < ActiveRecord::Migration
  def change
    change_column_default :lists, :completed, false
  end
end
