require 'spec_helper'

describe "news_items/index" do
  before(:each) do
    assign(:news_items, [
      stub_model(NewsItem),
      stub_model(NewsItem)
    ])
  end
end
