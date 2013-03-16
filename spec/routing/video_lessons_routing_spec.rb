require "spec_helper"

describe VideoLessonsController do
  describe "routing" do

    it "routes to #index" do
      get("/video_lessons").should route_to("video_lessons#index")
    end

    it "routes to #new" do
      get("/video_lessons/new").should route_to("video_lessons#new")
    end

    it "routes to #show" do
      get("/video_lessons/1").should route_to("video_lessons#show", :id => "1")
    end

    it "routes to #edit" do
      get("/video_lessons/1/edit").should route_to("video_lessons#edit", :id => "1")
    end

    it "routes to #create" do
      post("/video_lessons").should route_to("video_lessons#create")
    end

    it "routes to #update" do
      put("/video_lessons/1").should route_to("video_lessons#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/video_lessons/1").should route_to("video_lessons#destroy", :id => "1")
    end

  end
end
