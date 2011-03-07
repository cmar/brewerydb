require File.dirname(__FILE__) + '/spec_helper'

describe "brewerydb" do
  before(:all) do
    
  end
  
  it "should configure Rails initializer style" do
    BreweryDb.configure do |config|
       config.apikey = 'c01822f029486661bb3669a845b5ec14'
    end
    
    BreweryDb.apikey.should eq 'c01822f029486661bb3669a845b5ec14'
  end
  
  describe "Breweries" do
    
    it "should retrieve a list of breweries" do
      @request_object = HTTParty::Request.new Net::HTTP::Get, '/'
      @response_object = Net::HTTPOK.new('1.1', 200, 'OK')
      @response_object.stub(:body => "{foo:'bar'}")

      @response_object_bad = Net::HTTPOK.new('1.1', 500, 'OK')
      @response_object_bad.stub(:body => "{foo:'bar'}")
      
      @parsed_response = {"breweries" => {'brewery' => {'name' => 'dogfish head'}}}
      @response = HTTParty::Response.new(@request_object, @response_object, @parsed_response) 
          

      BreweryDb.should_receive(:get).and_return(@response)  
      BreweryDb.breweries['brewery']['name'].should == 'dogfish head'
    end
    
  end
end