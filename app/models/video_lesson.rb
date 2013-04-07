class VideoLesson < ActiveRecord::Base
  attr_accessible :description, :title, :videos_attributes
  validates_presence_of :title
  validates_presence_of :description

  has_many :videos, dependent: :destroy

  accepts_nested_attributes_for :videos, allow_destroy: true
end
