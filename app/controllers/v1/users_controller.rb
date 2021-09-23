module V1
  class UsersController < ApplicationController
    def user_percentage
      data = {
        percentage_within_chapter: percentage_within(Chapter.all),
        percentage_within_topic: percentage_within(Topic.all),
        percentage_within_subject: percentage_within(Subject.all),
        percentage_within_exam: percentage_within(Exam.all)
      }
      json_response(percentage: data)
    end

    private

    def percentage_within(within_records)
      data = []
      within_records.each do |within_record|
        within_record_questions = within_record.questions
        total_questions = within_record_questions.count

        data << {
          "#{within_record.name}": {
            correct_answers: calculate_percentage(
              total_questions, current_user.answers.where(
                question_id: within_record_questions.map(&:id), correct: true, skip: false
              ).count
            ),
            wrong_answers: calculate_percentage(
              total_questions, current_user.answers.where(
                question_id: within_record_questions.map(&:id), correct: false, skip: false
              ).count
            ),
            skipped_questions: calculate_percentage(
              total_questions, current_user.answers.where(
                question_id: within_record_questions.map(&:id), skip: true
              ).count
            ),
            unseen_questions: calculate_percentage(
              total_questions, (
                total_questions - current_user.answers.where(question_id: within_record_questions.map(&:id)).count
              )
            )
          }
        }
      end
      data
    end
  end
end
