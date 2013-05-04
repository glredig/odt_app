class CreateLessonFeeds < ActiveRecord::Migration
  def change
  	create_table :lesson_feeds do |t|
  		t.string :model_name
  		t.string :item_id

  		t.timestamps
  	end
  end
end
