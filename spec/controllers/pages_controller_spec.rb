require 'spec_helper'

describe PagesController do

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end

    it "search_results should not return songs if params blank" do
      page = mock(:page)
      page.stub(:search_result).and_return('')
      get 'home', :song => ''
      page.search_result.should be_blank
      
    end
    
    it "search_results should return songs if params not blank" do
      page = mock(:page)
      page.stub(:search_result).and_return('One')
      get 'home', :song => 'One'
      page.search_result.should == 'One'
    end
  end

end
