class CreateQuestionOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :question_options do |t|
      t.belongs_to :question, index: true

      t.string  :option
      t.boolean :correct, default: false

      t.timestamps
    end
  end
end
