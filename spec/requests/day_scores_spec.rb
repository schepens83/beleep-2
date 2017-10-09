require 'rails_helper'

RSpec.describe "DayScores", type: :request do
  describe "GET /day_scores" do
    it "works! (now write some real specs)" do
      get day_scores_path
      expect(response).to have_http_status(200)
    end
  end
end
