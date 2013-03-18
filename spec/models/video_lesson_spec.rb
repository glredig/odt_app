require 'spec_helper'

describe VideoLesson do
  # let(:user) { FactoryGirl.create(:user) }
  before { @video_lesson = VideoLesson.create(title: "Video 1", description: "This is Video Lesson 1") }

  subject { @video_lesson }

  it { should respond_to(:title) }
  it { should respond_to(:description) }

  describe "when it doesn't have a title" do
  	before { @video_lesson.title = nil }
  	it { should_not be_valid }
  end

  describe "when it doesn't have a description" do
  	before { @video_lesson.description = nil }
  	it { should_not be_valid }
  end
end
