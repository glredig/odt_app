require "spec_helper"

describe WrittenLessonsController do
  describe "routing" do

    it "routes to #index" do
      get("/written_lessons").should route_to("written_lessons#index")
    end

    it "routes to #new" do
      get("/written_lessons/new").should route_to("written_lessons#new")
    end

    it "routes to #show" do
      get("/written_lessons/1").should route_to("written_lessons#show", :id => "1")
    end

    it "routes to #edit" do
      get("/written_lessons/1/edit").should route_to("written_lessons#edit", :id => "1")
    end

    it "routes to #create" do
      post("/written_lessons").should route_to("written_lessons#create")
    end

    it "routes to #update" do
      put("/written_lessons/1").should route_to("written_lessons#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/written_lessons/1").should route_to("written_lessons#destroy", :id => "1")
    end

  end
end
