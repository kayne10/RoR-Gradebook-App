class AddStudentNameToEnrollment < ActiveRecord::Migration[5.1]
  def change
    add_column :enrollments, :student_name, :string
  end
end
