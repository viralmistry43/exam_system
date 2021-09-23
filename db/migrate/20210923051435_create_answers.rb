class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.belongs_to :user, index: true
      t.belongs_to :question, index: true
      t.belongs_to :question_option, index: true

      t.boolean :correct, default: false
      t.boolean :skip, default: false

      t.timestamps
    end
  end
end
