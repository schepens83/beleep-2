require "rails_helper"

RSpec.describe DayScoresController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/day_scores").to route_to("day_scores#index")
    end

    it "routes to #new" do
      expect(:get => "/day_scores/new").to route_to("day_scores#new")
    end

    it "routes to #show" do
      expect(:get => "/day_scores/1").to route_to("day_scores#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/day_scores/1/edit").to route_to("day_scores#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/day_scores").to route_to("day_scores#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/day_scores/1").to route_to("day_scores#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/day_scores/1").to route_to("day_scores#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/day_scores/1").to route_to("day_scores#destroy", :id => "1")
    end

  end
end
