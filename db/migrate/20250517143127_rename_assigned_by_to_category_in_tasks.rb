class RenameAssignedByToCategoryInTasks < ActiveRecord::Migration[8.0]
  def change
    rename_column :tasks, :assigned_by, :category
  end
end
