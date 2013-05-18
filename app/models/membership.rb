class Membership < ActiveRecord::Base
	attr_accessible :user_id, :premium

	validates_presence_of :user_id
end