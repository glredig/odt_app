class Blogpost < ActiveRecord::Base
  attr_accessible :content
  validates :user_id, presence: true
  validates :content, presence: true
  belongs_to :user

  default_scope order: 'blogposts.created_at DESC'
end