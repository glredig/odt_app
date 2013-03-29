require 'spec_helper'

describe "news_items/show" do
  before(:each) do
    @news_item = assign(:news_item, stub_model(NewsItem))
  end
end
