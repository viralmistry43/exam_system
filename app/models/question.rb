class Question < ApplicationRecord
  belongs_to :chapter
  has_many :question_options

  enum category: %w[easy medium hard]

  validates :name, presence: true, length: { maximum: 255 }
  validates :question_number, presence: true
end
