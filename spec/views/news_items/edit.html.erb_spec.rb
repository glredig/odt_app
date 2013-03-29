require 'spec_helper'

describe "news_items/edit" do
  before(:each) do
    @news_item = assign(:news_item, stub_model(NewsItem))
  end

  it "renders the edit news_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => news_items_path(@news_item), :method => "post" do
    end
  end
end
