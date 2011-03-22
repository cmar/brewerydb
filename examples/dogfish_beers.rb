require 'rubygems'
require 'brewerydb'

# Gets all the dogfish head beers. make sure you
# set your API KEY

BreweryDb.configure do |config|
	  config.apikey = 'YOUR_API_KEY'
end

# Get all the DogFish Head Beers
results = BreweryDb.beers(:brewery_id => 459)

results.beer.each do |beer|
  puts beer.name
end

puts "Page: #{results.pages.page}"
puts "Total: #{results.pages.total}"