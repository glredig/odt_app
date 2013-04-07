class Video < ActiveRecord::Migration
  def change
  	create_table :videos do |t|
  		t.string :video_url
  		t.string :type

  		t.timestamps
  	end
  end
end
