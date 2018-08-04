class Grade < ApplicationRecord
  belongs_to :user #student
  belongs_to :course #grade for course
  validates :value, presence: true, length: {max:1}
end
