class AddPremiumOnlyToVideoLesson < ActiveRecord::Migration
  def change
  	add_column :video_lessons, :premium_only, :boolean, default: true 
  end
end
