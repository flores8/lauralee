class AddDescriptionToLessons < ActiveRecord::Migration
  def change
  	add_column :lessons, :description, :text
    add_index :lessons, :description
  end
end
