require 'rails_helper'

RSpec.describe "day_scores/show", type: :view do
  before(:each) do
    @day_score = assign(:day_score, DayScore.create!(
      :tension => "9.99",
      :sleep => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
