require File.dirname(__FILE__) + '/spec_helper'

describe "brewerydb" do
  
  it "should configure Rails initializer style" do
    BreweryDb.configure do |config|
       config.apikey = 'c01822f029486661bb3669a845b5ec14'
    end
    
    BreweryDb.apikey.should eq 'c01822f029486661bb3669a845b5ec14'
  end
  
  describe "Search" do
    let (:response) {
      mock_httparty_response({
            "results" => {'result' => [{'name' => 'Stone Brewing', 'type' => 'Brewery'},
                                       {'name' => 'Stone IPA', 'type' => 'Beer'}   
                                      ],
                          'pages' => {'page' => 1, 'total' => 2}           
                          }
            })
    }
    
    let (:no_results_response) {
        mock_httparty_response({
              "results" => {'pages' => {'page' => 1, 'total' => 2}           
                            }
              })
    }
      
    it "retrieves results by search" do
      BreweryDb.should_receive(:get).and_return(response)
      BreweryDb.search.result.first.name.should == 'Stone Brewing'      
    end
    
    it "handles no results" do
      BreweryDb.should_receive(:get).and_return(no_results_response)
      BreweryDb.search.result.should be_nil 
    end
    
  end
  
  describe "Breweries" do
    before(:each) do
      @response = mock_httparty_response({
            "breweries" => {'brewery' => [{'name' => 'dogfish head'}, {'name' => 'stone brewery'}],
                            'pages' => {'page' => 1, 'total' => 20 }}
      })
      BreweryDb.should_receive(:get).and_return(@response)
    end
    
    it "should retrieve a list of breweries" do
      BreweryDb.breweries.brewery.first.name.should == 'dogfish head'
    end
    
  end
  
  describe "Brewery" do
    before(:each) do
      @response = mock_httparty_response({
            "breweries" => {'brewery' => {'name' => 'dogfish head'}}
      })
      BreweryDb.should_receive(:get).and_return(@response)
    end
    
    it "should retrieve a specific brewery" do
        BreweryDb.brewery(1000).name.should == 'dogfish head'
    end
  end
  
  context "Beers" do
    before(:each) do
      @response = mock_httparty_response({
            "beers" => {'beer' => [{'name' => 'midas touch'}, {'name' => 'chica stout'}],
                        'pages' => {'page' => 1, 'total' => 20 }
                       }
      })
      BreweryDb.should_receive(:get).and_return(@response)
    end
    
    it "retrieves a list of beers" do
      BreweryDb.beers.beer.first.name.should == 'midas touch'
    end
    
  end
  
  context "Beer" do
    before(:each) do
      @response = mock_httparty_response({
            "beers" => {'beer' => {'name' => 'midas touch'}
                       }
      })
      BreweryDb.should_receive(:get).and_return(@response)
    end
    
    it "should retrieve a specific beer" do
      BreweryDb.beer(1000)['name'].should == 'midas touch'
    end
  end
  
  describe "Categories" do
    before(:each) do
      @response = mock_httparty_response({
            "categories" => {'category' => {'name' => 'stout'}}
      })
      BreweryDb.should_receive(:get).and_return(@response)
    end
    
    it "should retrieve a list of categories" do
      BreweryDb.categories['category']['name'].should == 'stout'
    end
    
    it "should retrieve a specific category" do
      BreweryDb.category(1000)['name'].should == 'stout'
    end
  end
  
  describe "Styles" do
    before(:each) do
      @response = mock_httparty_response({
            "styles" => {'style' => {'name' => 'ale'}}
      })
      BreweryDb.should_receive(:get).and_return(@response)
    end
    
    it "should retrieve a list of categories" do
      BreweryDb.styles['style']['name'].should == 'ale'
    end
    
    it "should retrieve a specific category" do
      BreweryDb.style(1)['name'].should == 'ale'
    end
  end
  
  describe "Glassware" do
    before(:each) do
      @response = mock_httparty_response({
            "glassware" => {'glass' => {'name' => 'mug'}}
      })
      BreweryDb.should_receive(:get).and_return(@response)
    end
    
    it "should retrieve a list of categories" do
      BreweryDb.glassware['glass']['name'].should == 'mug'
    end
    
    it "should retrieve a specific category" do
      BreweryDb.glass(1)['name'].should == 'mug'
    end
  end
end