require 'rubygems'
require 'brewerydb'

BreweryDb.configure do |config|
   config.apikey = 'YOUR_API_KEY'
end

# q => (string) Your query to search on [required] 
# type => (string) Can be set to beer to return just beers, brewery to 
# return just breweries or left empty to return both beers and 
# breweries. 
# metadata => (true or 1) if set will return more data about the beer or 
# brewery 
# page => (int) if there are more pages to page through.

results = BreweryDb.search(:q => 'stone')

puts "Page: #{results.pages.page}"
puts "Total: #{results.pages.total}"

results.result.each do |result|
  puts "#{result.id}: #{result.name} (#{result['type']})"
end if results.result #check if there is a result before looping

#Expected Output
# 1
# 2
# 1204: Stone Brewing Company (Brewery)
# 821: Stone IPA (Beer)
# 1258: Stone Pale Ale (Beer)
# 1205: Stone Cellar Brewpub & Restaurant (Brewery)
# 6869: Old Stone Wall (Beer)
# 1193: Standing Stone Brewing Company (Brewery)
# 2638: Stone Teepee Pale Ale (Beer)
# 4801: Stone 10th Anniversery IPA (Beer)
# 4423: Stone 11th Anniversery Ale (Beer)
# 4800: Stone 12 Anniversery Bitter Chocolate Oatmeal Stout (Beer)
# 3066: Stone Beer (Beer)
# 1206: Stone City Brewing (Brewery)
# 341: Blarney Stone Stout (Beer)
# ...