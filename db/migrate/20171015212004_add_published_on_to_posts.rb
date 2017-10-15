class AddPublishedOnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :published_on, :date
    add_index :posts, :published_on
  end
end
