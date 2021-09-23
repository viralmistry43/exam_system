class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :question_option, optional: true

  before_validation :question_option_validation

  after_create :answer_correct_or_not

  def question_option_validation
    return if self.skip?

    errors[:base] << 'Select one option please.' if question_option_id.blank?
  end

  def answer_correct_or_not
    return if self.skip?

    self.update(correct: question_option.correct)
  end
end
