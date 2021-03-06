class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :premium
  has_secure_password
  has_many :blogposts, dependent: :destroy
  has_many :news_items, dependent: :destroy

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  after_save :create_membership

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

    def create_membership
      membership = Membership.new(user_id: self.id)
      membership.save!
    end
end
