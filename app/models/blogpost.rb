class Blogpost < ActiveRecord::Base
  attr_accessible :content, :title
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true
  belongs_to :user

  default_scope order: 'blogposts.created_at DESC'

  def blog_title
  	self.title || "(No title)"
  end
end
