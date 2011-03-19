require "spec_helper"

describe RequestsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/requests" }.should route_to(:controller => "requests", :action => "index")
    end

    it "recognizes and generates #create" do
      { :post => "/requests" }.should route_to(:controller => "requests", :action => "create")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/requests/1" }.should route_to(:controller => "requests", :action => "destroy", :id => "1")
    end

  end
end
