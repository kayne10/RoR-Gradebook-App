class Course < ApplicationRecord
  has_and_belongs_to_many :user # Teachers have many courses and courses have many students
  has_many :grade
  validates :title, presence: true, length: {maximum: 50}
  validates :start_date, presence: true
  validates :end_date, presence: true
end
