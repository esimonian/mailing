require 'rails_helper'

RSpec.describe "campaigns/index", type: :view do
  before(:each) do
    assign(:campaigns, [
      Campaign.create!(
        :title => "Title",
        :description => "Description",
        :status => "Status"
      ),
      Campaign.create!(
        :title => "Title",
        :description => "Description",
        :status => "Status"
      )
    ])
  end

  it "renders a list of campaigns" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
