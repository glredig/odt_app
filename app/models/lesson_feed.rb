class LessonFeed < ActiveRecord::Base
	attr_accessible :model_name, :item_id

	validates_presence_of :model_name
	validates_presence_of :item_id	

end