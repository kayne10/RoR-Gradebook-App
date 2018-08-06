class DropEnrollmentsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :enrollments
  end
end
