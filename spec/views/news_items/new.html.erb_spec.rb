require 'spec_helper'

describe "news_items/new" do
  before(:each) do
    assign(:news_item, stub_model(NewsItem).as_new_record)
  end

  it "renders new news_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => news_items_path, :method => "post" do
    end
  end
end
