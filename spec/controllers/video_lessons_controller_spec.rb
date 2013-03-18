require 'spec_helper'

describe VideoLessonsController do
	let!(:valid_lesson_1) { FactoryGirl.create(:video_lesson, title: "Video 1", description: "Video 1's description") }
	let!(:valid_lesson_2) { FactoryGirl.create(:video_lesson, title: "Video 2", description: "Video 2's description") }
	# let(:invalid_lesson) { FactoryGirl.create(title: "", description: "Video 1's descritpion") }

    describe "#index" do
    	it "creates a list of video lessons" do
    		get :index
    		assigns(:video_lessons).should eq([valid_lesson_1, valid_lesson_2])
    	end
    	it "renders the index" do
    		get :index
    		response.should render_template :index
    	end
    end

    describe "#show" do
    	it "assigns the variable @video_lesson" do
    		get :show, id: valid_lesson_1
    		assigns(:video_lesson).should eq(valid_lesson_1)
    	end
    	it "renders the show" do
    		get :show, id: valid_lesson_1
    		response.should render_template :show
    	end
    end

    # describe "#new" do
    # 	it "assigns a title, description and url to a new video lesson" do
    # 		get :new
    # 		assigns(:video_lesson).title.should == ""
    # 	end
    	
    # 	# it "renders the new"
    # end

    # describe "#create" do
    # 	context "with valid attributes" do
    # 		it "saves the new video lesson"
    # 		it "redirects to the index"

    # 	context "with invalid attributes" do
    # 		it "does not save the video lesson"
    # 		it "re-renders the page with a warning"
    # end
end