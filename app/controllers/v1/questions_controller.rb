module V1
  class QuestionsController < ApplicationController
    before_action :fetch_questions_already_answered_by_current_user

    def index
      questions = Question.where.not(id: @question_ids).order("RANDOM()")
      if questions.blank?
        successful_response('The questions that user has skipped.')
      else
        json_response(list: questions)
      end
    end

    private

    def fetch_questions_already_answered_by_current_user
      @question_ids = current_user.answers.map(&:question_id)
    end
  end
end
