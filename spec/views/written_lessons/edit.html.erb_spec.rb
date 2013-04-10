require 'spec_helper'

describe "written_lessons/edit" do
  before(:each) do
    @written_lesson = assign(:written_lesson, stub_model(WrittenLesson))
  end

  it "renders the edit written_lesson form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => written_lessons_path(@written_lesson), :method => "post" do
    end
  end
end
