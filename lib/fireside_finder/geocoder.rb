require_relative '../fireside_finder'
require 'nokogiri'
require 'pry'
require 'geocoder'
require 'httparty'

class FiresideFinder::Geocode
  attr_accessor :geoaddress, :user_input

  def self.geosearch
    Geocoder.coordinates(@user_input)
  end
end
