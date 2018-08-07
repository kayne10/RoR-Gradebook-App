class Course < ApplicationRecord
  has_and_belongs_to_many :user # Teachers have many courses and courses have many students
  has_many :grade
  belongs_to :semester
  validates :title, presence: true, length: {maximum: 50}
  validates :semester_id, presence: true
  validates :user_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
