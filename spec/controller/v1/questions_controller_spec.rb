require 'rails_helper'

RSpec.describe V1::QuestionsController, type: :controller do
  let(:user) { User.first }
  let(:first_question) { Question.first }

  describe 'GET /questions in questions#index' do
    it 'status 200: Return all questions' do
      user.answers.create(
        question_id: first_question.id, question_option_id: first_question.question_options.first.id
      )
      get :index, format: :json
      expect(response.status).to eq(200)
    end
  end
end
