require 'spec_helper'

describe "requests/edit.html.haml" do
  before(:each) do
    @request = assign(:request, stub_model(Request,
      :track => "MyString",
      :artist => "MyString",
      :points => 1
    ))
  end

  it "renders the edit request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => requests_path(@request), :method => "post" do
      assert_select "input#request_track", :name => "request[track]"
      assert_select "input#request_artist", :name => "request[artist]"
      assert_select "input#request_points", :name => "request[points]"
    end
  end
end
