class AddDescriptionToCourses < ActiveRecord::Migration
  def change
  	add_column :courses, :description, :text
    add_index :courses, :description
  end
end
