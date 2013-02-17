class BlogpostsController < ApplicationController
	before_filter :signed_in_user

	def index
		@blogposts = Blogpost.all
	end

	def show
		@blogpost = Blogpost.find(params[:id])
	end

	def new
		@blogpost = Blogpost.new
	end

	def create
		@blogpost = current_user.blogposts.build(params[:blogpost])
		if @blogpost.save
			flash[:success] = "Blog entry posted!"
			redirect_to blogposts_path
		else
			flash[:alert] = "Blog entry wasn't created."
			redirect_to new_blogpost_path
		end
	end

	def destroy

	end
end