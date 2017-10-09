require 'rails_helper'

RSpec.describe "day_scores/index", type: :view do
  before(:each) do
    assign(:day_scores, [
      DayScore.create!(
        :tension => "9.99",
        :sleep => "9.99"
      ),
      DayScore.create!(
        :tension => "9.99",
        :sleep => "9.99"
      )
    ])
  end

  it "renders a list of day_scores" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
