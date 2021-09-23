class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.belongs_to :subject, index: true

      t.integer :topic_number
      t.string  :name

      t.timestamps
    end
  end
end
