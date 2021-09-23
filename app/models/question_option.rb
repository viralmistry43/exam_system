class QuestionOption < ApplicationRecord
  belongs_to :question

  validates :option, presence: true, length: { maximum: 255 }
end
