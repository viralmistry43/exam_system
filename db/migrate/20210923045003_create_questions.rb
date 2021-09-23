class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.belongs_to :chapter, index: true

      t.integer :question_number
      t.integer :category, limit: 1, default: 0
      t.string  :name

      t.timestamps
    end
  end
end
