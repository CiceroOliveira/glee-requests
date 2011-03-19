require 'spec_helper'

describe "requests/index.html.haml", :type => :request do
  before(:each) do
    assign(:requests, [
      stub_model(Request,
        :track => "Track",
        :artist => "Artist",
        :points => 3
      ),
      stub_model(Request,
        :track => "Track",
        :artist => "Artist",
        :points => 3
      )
    ])
  end

  it "renders a list of requests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Track".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Artist".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
