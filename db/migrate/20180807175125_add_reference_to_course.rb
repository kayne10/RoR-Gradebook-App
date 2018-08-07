class AddReferenceToCourse < ActiveRecord::Migration[5.1]
  def change
    add_reference :courses, :semester, index: true
    add_foreign_key :courses, :semesters
  end
end
