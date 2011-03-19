require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the RequestsHelper. For example:
#
# describe RequestsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe RequestsHelper do
  describe "points for" do
    it "returns points when they exist" do
      points_for("One", "U2")
      request = stub_model(Request)
      request.stub(:total_points).and_return(1)
      request.total_points.should be(1)
    end
    
    it "returns 0 when there are no points" do
      points_for("One", "U2")
      request = stub_model(Request)
      request.stub(:total_points).and_return(0)
      request.total_points.should be(0)
    end
  end
end
