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
    FiresideFinder::CLI.menu
  end

  def list_local
    @local_gatherings = Scraper::scrape_list
  end

  def self.menu
    FiresideFinder::Scraper::scrape_list(@user_input)
    while @user_input != "exit"
      counter = 0
      FiresideFinder::Gathering.all.each do |gather|
        counter += 1
        puts counter
        gather.inspect.split('@').each do |detail|
          puts detail
        end
      end
      puts "Enter the number of the event you'd like more info on, or type exit to exit:"
      user_input = gets.strip.downcase
      case @user_input
      when "1"
        puts "more info on 1"
      when "2"
        puts "more info on 2"
      end
    end
  end
end
binding.pry
