require 'spec_helper'

describe "written_lessons/index" do
  before(:each) do
    assign(:written_lessons, [
      stub_model(WrittenLesson),
      stub_model(WrittenLesson)
    ])
  end
end
