class Course < ApplicationRecord
  # Teachers have many courses and courses have many students
  # has_and_belongs_to_many :user
  has_many :grade
  has_many :enrollment
  belongs_to :semester
  belongs_to :user
  validates :title, presence: true, length: {maximum: 50}
  validates :semester_id, presence: true
  validates :user_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
