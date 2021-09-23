class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.belongs_to :exam, index: true

      t.string  :name
      t.string  :standard

      t.timestamps
    end
  end
end
