class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :most_interested

      t.timestamps
    end
  end
end
