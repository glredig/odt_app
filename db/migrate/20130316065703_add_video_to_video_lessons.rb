class AddVideoToVideoLessons < ActiveRecord::Migration
  def change
  	add_column :video_lessons, :video, :string
  end
end
