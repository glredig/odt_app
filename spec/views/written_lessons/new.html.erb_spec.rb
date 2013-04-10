require 'spec_helper'

describe "written_lessons/new" do
  before(:each) do
    assign(:written_lesson, stub_model(WrittenLesson).as_new_record)
  end

  it "renders new written_lesson form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => written_lessons_path, :method => "post" do
    end
  end
end
