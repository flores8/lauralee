class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :body
      t.integer :lesson_number

      t.timestamps
    end
  end
end
