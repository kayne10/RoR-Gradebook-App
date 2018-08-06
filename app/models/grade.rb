class Grade < ApplicationRecord
  belongs_to :user #student
  belongs_to :course #grade for course
  validates :grade_value, presence: true, length: {maximum:1}
end
