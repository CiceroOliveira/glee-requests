require 'spec_helper'

describe "requests/show.html.haml" do
  before(:each) do
    @request = assign(:request, stub_model(Request,
      :track => "Track",
      :artist => "Artist",
      :points => 1
    ))
  end

  # it "renders attributes in <p>" do
  #     render
  #     # Run the generator again with the --webrat flag if you want to use webrat matchers
  #     rendered.should match(/Track/)
  #     # Run the generator again with the --webrat flag if you want to use webrat matchers
  #     rendered.should match(/Artist/)
  #     # Run the generator again with the --webrat flag if you want to use webrat matchers
  #     rendered.should match(/1/)
  #   end
end
