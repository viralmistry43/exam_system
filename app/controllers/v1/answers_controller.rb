module V1
  class AnswersController < ApplicationController
    def create
      answers = current_user.answers.new(question_params)
      if answers.save
        successful_post(answers.id, 'Answers Store Successfully.')
      else
        unprocessable_entity(answers.errors.full_messages.join(','))
      end
    end

    private

    def question_params
      params.permit(:question_id, :question_option_id, :skip)
    end
  end
end
