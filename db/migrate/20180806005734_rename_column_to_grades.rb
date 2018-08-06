class RenameColumnToGrades < ActiveRecord::Migration[5.1]
  def change
    rename_column :grades, :value, :grade_value
  end
end
