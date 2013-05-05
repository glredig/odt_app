class AddPremiumOnlyToWrittenLesson < ActiveRecord::Migration
  def change
  	add_column :written_lessons, :premium_only, :boolean, default: true 
  end
end
