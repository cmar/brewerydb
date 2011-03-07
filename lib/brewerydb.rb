require 'rubygems'
require 'httparty'

#
# BreweryDb.configure do |config|
#   config.apikey = 'c0189f0299dd9333669a845b5ec14'
# end
#
class BreweryDb
  include HTTParty
  base_uri 'http://www.brewerydb.com/api'
  format :json
  default_params :format => 'JSON'
  @@apikey = nil
  
  def self.breweries(options={})
    options.merge!({
      :apikey => apikey
    })
        
    response = get("/breweries", :query => options)
    response['breweries'] if response.code == 200
  end
  
  def self.brewery(id, options={})
    options.merge!({
      :apikey => apikey
    })
    
    response = get("/breweries/#{id}", :query => options)
    response['breweries']['brewery'] if response.code == 200
  end
  
  def self.beers(options={})
    options.merge!({
      :apikey => apikey
    })
        
    response = get("/beers", :query => options)
    response['beers'] if response.code == 200
  end
  
  def self.beer(id, options={})
    options.merge!({
      :apikey => apikey
    })
    
    response = get("/beers/#{id}", :query => options)
    response['beers']['beer'] if response.code == 200
  end
  
  def self.styles(options={})
    options.merge!({
      :apikey => apikey
    })
        
    response = get("/styles", :query => options)
    response['styles'] if response.code == 200
  end
  
  def self.style(id, options={})
    options.merge!({
      :apikey => apikey
    })
        
    response = get("/styles/#{id}", :query => options)
    response['styles']['style'] if response.code == 200
  end
  
  def self.categories(options={})
    options.merge!({
      :apikey => apikey
    })
        
    response = get("/categories", :query => options)
    response['categories'] if response.code == 200
  end

  def self.category(id, options={})
    options.merge!({
      :apikey => apikey
    })
        
    response = get("/categories/#{id}", :query => options)
    response['categories']['category'] if response.code == 200
  end
  
  def self.glassware(options={})
    options.merge!({
      :apikey => apikey
    })
        
    response = get("/glassware", :query => options)
    response['glassware'] if response.code == 200
  end

  def self.glass(id, options={})
    options.merge!({
      :apikey => apikey
    })
        
    response = get("/glassware/#{id}", :query => options)
    response['glassware']['glass'] if response.code == 200
  end
  
  def self.apikey
    @@apikey
  end

  def self.apikey=(apikey)
    @@apikey = apikey
  end
  
  def self.configure
    yield self
  end
  
end

