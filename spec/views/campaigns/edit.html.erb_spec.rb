require 'rails_helper'

RSpec.describe "campaigns/edit", type: :view do
  before(:each) do
    @campaign = assign(:campaign, Campaign.create!(
      :title => "MyString",
      :description => "MyString",
      :status => "MyString"
    ))
  end

  it "renders the edit campaign form" do
    render

    assert_select "form[action=?][method=?]", campaign_path(@campaign), "post" do

      assert_select "input[name=?]", "campaign[title]"

      assert_select "input[name=?]", "campaign[description]"

      assert_select "input[name=?]", "campaign[status]"
    end
  end
end
