class Semester < ApplicationRecord
  has_many :course
  has_many :enrollment
  validates :title, presence:true, length: {minimum:8}
end
