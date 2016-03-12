# our CLI Controller
require_relative '../fireside_finder'
require_relative 'geocoder'
require_relative 'scraper'
require 'nokogiri'
require 'pry'
require 'geocoder'
require 'httparty'

class FiresideFinder::CLI
  attr_accessor :user_input, :geoaddress

  def self.call
    puts "Please enter an address or zip-code to find nearby Fireside Gatherings:"
    @user_input = gets.strip
    FiresideFinder::Scraper::scrape_list(@user_input)
  end

  # def list_local
  #   @local_gatherings = Scraper::scrape_list
  # end
  #
  # def menu
  #   user_input = nil
  #   while user_input != "exit"
  #     puts "Enter the number of the event you'd like more info on, or type exit to exit:"
  #     user_input = gets.strip.downcase
  #     case user_input
  #     when "1"
  #       puts "more info on 1"
  #     when "2"
  #       puts "more info on 2"
  #     end
  #   end
  # end
end
binding.pry
