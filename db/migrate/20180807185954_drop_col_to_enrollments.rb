class DropColToEnrollments < ActiveRecord::Migration[5.1]
  def change
    remove_column :enrollments, :grade_id
  end
end
