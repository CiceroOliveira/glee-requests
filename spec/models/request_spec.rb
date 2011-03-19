require 'spec_helper'

describe Request do
  let(:request) {Request.new}
  
  it "should return total points when points assigned" do
    request.stub(:points_assigned).and_return(1)
    request.total_points.should == 1
  end
  
  it "should return zero points when no points yet exist" do
    request.stub(:points_assigned).and_return(0)
    request.total_points.should == 0
  end
  
  it "should return nil when request does not exist" do
    params = {:track => 'One', :artist => 'U2'}
    request.track = params[:track]
    request.artist = params[:artist]
    request.read_request.should be_nil
  end
  
  it "should update request's points when it exists" do
    params = {:track => 'One', :artist => 'U2'}
    request.track = params[:track]
    request.artist = params[:artist]
    request.points = 1
    request.stub(:read_request).and_return(request)
    request.save_or_update(params)
  end
  
  it "should save request with one point when it does not exist" do
    params = {:track => 'One', :artist => 'U2'}
    request.stub(:read_request).and_return(nil)
    request.save_or_update(params)
    request.points.should be(1)
  end
  
  it "should be destroyed when last point subtracted"
  
  it "should subtract points when not last" do
    request.points = 2
    request.subtract_point
    request.points.should be(1)
  end
end
