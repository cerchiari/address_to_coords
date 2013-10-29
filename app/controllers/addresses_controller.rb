require 'open-uri'
require 'json'

class AddressesController < ApplicationController
  def fetch_coordinates
    @address = "the corner of Foster and Sheridan"
    @url_safe_address = URI.encode(@address)

    # Your code goes here.
    url = "http://maps.googleapis.com/maps/api/geocode/json?address=the+corner+of+Foster+and+Sheridan,+Evanston,+IL&sensor=false"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)

    results = parsed_data["results"]
    first = results[0]
    first.keys

    geometry = first["geometry"]
    geometry.keys
    location = geometry["location"]

    @latitude = location["lat"]
    @longitude = location["lng"]
  end
end
