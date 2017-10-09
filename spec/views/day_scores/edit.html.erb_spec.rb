require 'rails_helper'

RSpec.describe "day_scores/edit", type: :view do
  before(:each) do
    @day_score = assign(:day_score, DayScore.create!(
      :tension => "9.99",
      :sleep => "9.99"
    ))
  end

  it "renders the edit day_score form" do
    render

    assert_select "form[action=?][method=?]", day_score_path(@day_score), "post" do

      assert_select "input[name=?]", "day_score[tension]"

      assert_select "input[name=?]", "day_score[sleep]"
    end
  end
end
