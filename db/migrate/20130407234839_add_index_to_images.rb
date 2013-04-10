class AddIndexToImages < ActiveRecord::Migration
  def change
  	add_index :images, [:written_lesson_id, :created_at]
  end
end
