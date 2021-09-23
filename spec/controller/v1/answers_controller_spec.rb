require 'rails_helper'

RSpec.describe V1::AnswersController, type: :controller do
  let(:user) { User.first }
  let(:question) { Question.first }
  let(:question_option) { question.question_options.first }

  describe 'POST /answers in answers#create' do
    it 'status 201: Return Answers Store Successfully.' do
      expect do
        post :create, format: :json, params: {
          question_id: question.id,
          question_option_id: question_option.id
        }
      end. to change(Answer, :count).by(1)
      expect(response.body).to eq({
        "status": 'Success',
        "message": 'Answers Store Successfully.',
        "id": Answer.last.id
      }.to_json)
      expect(response.status).to eq(201)
    end

    it 'status 201: Return Answers Store Successfully (skip) .' do
      expect do
        post :create, format: :json, params: {
          question_id: question.id,
          skip: true
        }
      end. to change(Answer, :count).by(1)
      expect(response.body).to eq({
        "status": 'Success',
        "message": 'Answers Store Successfully.',
        "id": Answer.last.id
      }.to_json)
      expect(response.status).to eq(201)
    end

    it 'status 422: Return Unprocessable Entity' do
      expect do
        post :create, format: :json, params: {
          question_id: question.id,
          question_option: nil,
          skip: false
        }
      end. to change(Answer, :count).by(0)
      expect(response.body).to eq({
        "status": 'Error',
        "message": 'Select one option please.'
      }.to_json)
      expect(response.status).to eq(422)
    end
  end
end
