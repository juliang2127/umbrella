require "http"
require "json"

pp "Where are you?"

user_location = gets.chomp
#user_location = "Chicago"
pp user_location

map_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + user_location + "&key=" + ENV.fetch("GMAPS_KEY")

response = HTTP.get(map_url)

raw_response = response.to_s

parsed_response = JSON.parse(raw_response)

results = parsed_response.fetch("results")

first_result = results.at(0)

geo_results = first_result.fetch("geometry")

location_results = geo_results.fetch("location")

latitude = location_results.fetch("lat")

longitude = location_results.fetch("lng")

pp latitude
pp longitude
