require 'rails_helper'

RSpec.describe "day_scores/new", type: :view do
  before(:each) do
    assign(:day_score, DayScore.new(
      :tension => "9.99",
      :sleep => "9.99"
    ))
  end

  it "renders new day_score form" do
    render

    assert_select "form[action=?][method=?]", day_scores_path, "post" do

      assert_select "input[name=?]", "day_score[tension]"

      assert_select "input[name=?]", "day_score[sleep]"
    end
  end
end
