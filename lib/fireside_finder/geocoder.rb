require 'nokogiri'
require 'pry'
require 'geocoder'
require 'httparty'

class Geocode
  attr_accessor :geoaddress

  def self.geosearch(user_input)
    @geoaddress = Geocoder.search(user_input)
  end
end

binding.pry
