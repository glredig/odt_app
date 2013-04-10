require 'spec_helper'

describe "WrittenLessons" do
  describe "GET /written_lessons" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get written_lessons_path
      response.status.should be(200)
    end
  end
end
