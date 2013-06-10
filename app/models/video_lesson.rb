class VideoLesson < ActiveRecord::Base
  attr_accessible :description, :title, :premium_only, :videos_attributes
  validates_presence_of :title
  validates_presence_of :description

  has_many :videos, dependent: :destroy

  accepts_nested_attributes_for :videos, allow_destroy: true

  after_create :create_feed_item
  	
  def create_feed_item
  	feed = LessonFeed.new
  	feed[:model_name] = 'VideoLesson'
  	feed[:item_id] = self.id
  	feed.save
  end	
end
