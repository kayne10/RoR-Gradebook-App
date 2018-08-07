class AddReferenceToEnrollment < ActiveRecord::Migration[5.1]
  def change
    add_reference :enrollments, :grade, index: true
    add_foreign_key :enrollments, :grades
  end
end
