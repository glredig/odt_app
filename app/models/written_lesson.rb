class WrittenLesson < ActiveRecord::Base
  attr_accessible :title, :content, :images_attributes

  validates_presence_of :title
  validates_presence_of :content

  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true
end
