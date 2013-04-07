class RemoveVideoFromVideoLesson < ActiveRecord::Migration
  def up
  	remove_column :video_lessons, :video
  	remove_column :video_lessons, :ogg_video
  end

  def down
  	add_column :video_lessons, :video, :string
  	add_column :video_lessons, :ogg_video, :string
  end
end
