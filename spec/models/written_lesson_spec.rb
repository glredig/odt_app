require 'spec_helper'

describe WrittenLesson do
  # let(:user) { FactoryGirl.create(:user) }
  before { @written_lesson = WrittenLesson.create(title: "Written 1", content: "This is Written Lesson 1") }

  subject { @written_lesson }

  it { should respond_to(:title) }
  it { should respond_to(:content) }

  describe "when it doesn't have a title" do
  	before { @written_lesson.title = nil }
  	it { should_not be_valid }
  end

  describe "when it doesn't have content" do
  	before { @written_lesson.content = nil }
  	it { should_not be_valid }
  end
end

