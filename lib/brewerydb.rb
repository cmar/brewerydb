require 'rubygems'
require 'httparty'
require 'hashie'

#
# BreweryDb.configure do |config|
#   config.apikey = ''
# end

class BreweryDb
  include HTTParty
  base_uri 'http://api.brewerydb.com/v2'
  format :json
  default_params :format => 'JSON'
  @@apikey = nil

  def self.search(options={})
    options.merge!({
      :key => apikey
    })

    response = get("/search", :query => options)
    Hashie::Mash.new(response)['data'] if response.code == 200
  end

  def self.breweries(options={})
    options.merge!({
      :key => apikey
    })

    response = get("/breweries", :query => options)
    Hashie::Mash.new(response)['data'] if response.code == 200
  end

  def self.brewery(id, options={})
    options.merge!({
      :key => apikey
    })

    response = get("/brewery/#{id}", :query => options)
    Hashie::Mash.new(response)['data'] if response.code == 200
  end

  def self.beers(options={})
    options.merge!({
      :key => apikey
    })

    response = get("/beers", :query => options)
    Hashie::Mash.new(response)['data'] if response.code == 200
  end

  def self.beer(id, options={})
    options.merge!({
      :key => apikey
    })

    response = get("/beer/#{id}", :query => options)
    Hashie::Mash.new(response)['data'] if response.code == 200
  end

  def self.styles(options={})
    options.merge!({
      :key => apikey
    })

    response = get("/styles", :query => options)
    Hashie::Mash.new(response)['data'] if response.code == 200
  end

  def self.style(id, options={})
    options.merge!({
      :key => apikey
    })

    response = get("/style/#{id}", :query => options)
    Hashie::Mash.new(response)['data'] if response.code == 200
  end

  def self.categories(options={})
    options.merge!({
      :key => apikey
    })

    response = get("/categories", :query => options)
    Hashie::Mash.new(response)['data'] if response.code == 200
  end

  def self.category(id, options={})
    options.merge!({
      :key => apikey
    })

    response = get("/category/#{id}", :query => options)
    Hashie::Mash.new(response)['data'] if response.code == 200
  end

  def self.glassware(options={})
    options.merge!({
      :key => apikey
    })

    response = get("/glassware", :query => options)
    Hashie::Mash.new(response)['data'] if response.code == 200
  end

  def self.glass(id, options={})
    options.merge!({
      :key => apikey
    })

    response = get("/glass/#{id}", :query => options)
    Hashie::Mash.new(response)['data'] if response.code == 200
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

