require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do
  let(:user) { User.first }
  let(:first_question) { Question.first }
  let(:second_question) { Question.second }
  let(:last_question) { Question.last }

  describe 'GET /user/percentage in users#user_percentage' do
    it 'status 200: Return user percentage' do
      user.answers.create(
        question_id: first_question.id, question_option_id: first_question.question_options.first.id
      )
      user.answers.create(
        question_id: second_question.id, question_option_id: second_question.question_options.last.id
      )
      user.answers.create(
        question_id: last_question.id, skip: true
      )
      get :user_percentage, format: :json
      data = { percentage: {
                percentage_within_chapter: [
                  { Beginning: { correct_answers: 16.67, wrong_answers: 16.67, skipped_questions: 0.0, unseen_questions: 66.67 } },
                  { Advance: { correct_answers: 0.0, wrong_answers: 0.0, skipped_questions: 16.67, unseen_questions: 83.33 } }
                ],
                percentage_within_topic: [
                  { Plus: { correct_answers: 8.33, wrong_answers: 8.33, skipped_questions: 8.33, unseen_questions: 75.0 } }
                ],
                percentage_within_subject: [
                  { Maths: { correct_answers: 8.33, wrong_answers: 8.33, skipped_questions: 8.33, unseen_questions: 75.0 } }
                ],
                percentage_within_exam: [
                  { Board: { correct_answers: 8.33, wrong_answers: 8.33, skipped_questions: 8.33, unseen_questions: 75.0 } }
                ]
              } }
      expect(response.body).to eq(data.to_json)
      expect(response.status).to eq(200)
    end
  end
end
