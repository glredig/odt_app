class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: [:destroy, :index]

  def index
    @users = User.paginate(page: params[:page])
  end 

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:success] = "Welcome to the Online Drum Teacher!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    if User.find(params[:id]) == current_user
      flash[:alert] = "Cannot delete yourself."
    else
      User.find(params[:id]).destroy
      flash[:success] = "User successfully deleted."
    end
    redirect_to users_url
    
  end

  def make_premium
      if current_user.admin?
        @user = Membership.where(user_id: params[:user_id].to_i).first
        @user.premium = true
        @user.save!
      end

      redirect_to users_path
    end

    def make_basic
      if current_user.admin?
        @user = Membership.where(user_id: params[:user_id].to_i).first
        @user.premium = false
        @user.save!
      end

      redirect_to users_path
    end 

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
