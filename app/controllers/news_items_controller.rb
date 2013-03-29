class NewsItemsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :edit, :create, :update, :destroy]
  
  def index
    @news_items = NewsItem.paginate(page: params[:page])
  end

  def show
    @news_item = NewsItem.find(params[:id])
  end

  def new
    @news_item = NewsItem.new
  end

  def edit
    @news_item = NewsItem.find(params[:id])
  end

  def create
    @news_item = current_user.news_items.build(params[:news_item])
    if @news_item.save
      flash[:success] = "News Item posted!"
      redirect_to news_items_path
    else
      flash[:alert] = "News Item wasn't created."
      redirect_to new_news_item_path
    end
  end

  def update
    @news_item = NewsItem.find(params[:id])
  end

  def destroy
    @news_item = NewsItem.find(params[:id])
    @news_item.destroy
  end
end
