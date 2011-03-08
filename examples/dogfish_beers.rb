require 'rubygems'
require 'brewerydb'

# Gets all the dogfish head beers. make sure you
# set your API KEY

BreweryDb.configure do |config|
	  config.apikey = 'XX'
end

# Get all the DogFish Head Beers
beers = BreweryDb.beers(:brewery_id => 459)
beers['beer'].each do |beer|
  puts beer['name']
end

puts "Page: #{beers['pages']['page']}"
puts "Total: #{beers['pages']['total']}" 