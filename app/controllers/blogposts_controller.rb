class BlogpostsController < ApplicationController
	before_filter :signed_in_user, only: [:new, :edit, :create, :update, :destroy]

	def index
		@blogposts = Blogpost.paginate(page: params[:page])
	end

	def show
		@blogpost = Blogpost.find(params[:id])
	end

	def new
		@blogpost = Blogpost.new
	end

	def edit
		@blogpost = Blogpost.find(params[:id])
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

	def update 
		@blogpost = Blogpost.find(params[:id])

		if @blogpost.update_attributes(params[:blogpost])
			flash[:success] = "Changes saved!"
			redirect_to blogposts_path
		else
			flash[:alert] = "Changes weren't saved."
			redirect_to edit_blogpost_path(blogpost)
		end
	end

	def destroy
		Blogpost.find(params[:id]).destroy
		flash[:success] = "Post deleted."
		redirect_to blogposts_path
	end
end