class AddIndexToVideos < ActiveRecord::Migration
  def change
  	add_column :videos, :video_lesson_id, :integer
  	add_index :videos, [:video_lesson_id, :created_at]
  end
end
