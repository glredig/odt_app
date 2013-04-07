class AddOggVideoToVideoLesson < ActiveRecord::Migration
  def change
  	add_column :video_lessons, :ogg_video, :string
  end
end
