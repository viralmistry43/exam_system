class CreateExams < ActiveRecord::Migration[6.1]
  def change
    create_table :exams do |t|
      t.string  :name
      t.date    :date

      t.timestamps
    end
  end
end
