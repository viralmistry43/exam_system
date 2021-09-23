class Exam < ApplicationRecord
  has_many :subjects
  has_many :topics, through: :subjects
  has_many :chapters, through: :topics
  has_many :questions, through: :chapters

  validates :name, presence: true, length: { maximum: 255 }
  validates :date, presence: true
end
