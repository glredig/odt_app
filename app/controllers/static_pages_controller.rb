class StaticPagesController < ApplicationController
	def about
		@curtis_pic_1 = "https://onlinedrumteacher.s3.amazonaws.com/images/curtis_about_1.jpg"
		@curtis_pic_2 = "https://onlinedrumteacher.s3.amazonaws.com/images/curtis_about_2.jpg"
		@curtis_pic_3 = "https://onlinedrumteacher.s3.amazonaws.com/images/curtis_about_3.jpg"
		@curtis_pic_4 = "https://onlinedrumteacher.s3.amazonaws.com/images/curtis_about_4.jpg"
		@curtis_pic_5 = "https://onlinedrumteacher.s3.amazonaws.com/images/curtis_about_5.jpg"
		@curtis_pic_2 = "https://onlinedrumteacher.s3.amazonaws.com/images/curtis_about_6.jpg"
	end

	def lessons
	end

	def contact
	end
end
