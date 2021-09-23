class ApplicationController < ActionController::API
  include Response

  def current_user
    User.first
  end

  def calculate_percentage(total_questions, answers)
    return 0.0 if total_questions.zero? || total_questions.blank?

    value = (answers * 100.00) / total_questions
    value.round(2)
  end
end
