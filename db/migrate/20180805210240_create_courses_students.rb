class CreateCoursesStudents < ActiveRecord::Migration[5.1]
  def self.up
    create_table :courses_users do |t|
      t.references :users, null: false
      t.references :course, null: false
    end
    add_index(:courses_users, [:user_id, :course_id], :unique => true)
  end

  def self.down
    drop_table :courses_users
  end
end
