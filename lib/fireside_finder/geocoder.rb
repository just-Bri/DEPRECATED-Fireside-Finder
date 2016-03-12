require_relative '../fireside_finder'
require 'nokogiri'
require 'pry'
require 'geocoder'
require 'httparty'

class FiresideFinder::Geocode
  attr_accessor :geoaddress, :user_input

  def self.geosearch(user_input)
    @geoaddress = Geocoder.search(user_input)
    @geoaddress
  end
end

#binding.pry

# => [#<Geocoder::Result::Google:0x007fdb93157400
#   @cache_hit=nil,
#   @data=
#    {"address_components"=>
#      [{"long_name"=>"77551", "short_name"=>"77551", "types"=>["postal_code"]},
#       {"long_name"=>"Galveston", "short_name"=>"Galveston", "types"=>["locality", "political"]},
#       {"long_name"=>"Galveston County",
#        "short_name"=>"Galveston County",
#        "types"=>["administrative_area_level_2", "political"]},
#       {"long_name"=>"Texas", "short_name"=>"TX", "types"=>["administrative_area_level_1", "political"]},
#       {"long_name"=>"United States", "short_name"=>"US", "types"=>["country", "political"]}],
#     "formatted_address"=>"Galveston, TX 77551, USA",
#     "geometry"=>
#      {"bounds"=>
#        {"northeast"=>{"lat"=>29.2979259, "lng"=>-94.80971799999999},
#         "southwest"=>{"lat"=>29.2548409, "lng"=>-94.858819}},
#       "location"=>{"lat"=>29.2784215, "lng"=>-94.8365094},
#       "location_type"=>"APPROXIMATE",
#       "viewport"=>
#        {"northeast"=>{"lat"=>29.2979259, "lng"=>-94.80971799999999},
#         "southwest"=>{"lat"=>29.2548409, "lng"=>-94.858819}}},
#     "place_id"=>"ChIJ0_CQ8EmcP4YRDCwFtuMZMtw",
#     "types"=>["postal_code"]}>]
# [2] pry(main)>
