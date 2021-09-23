class CreateChapters < ActiveRecord::Migration[6.1]
  def change
    create_table :chapters do |t|
      t.belongs_to :topic, index: true

      t.integer :chapter_number
      t.string  :name

      t.timestamps
    end
  end
end
