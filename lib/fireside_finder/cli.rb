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
    puts "Use list to get back to this menu, exit will close the program."
    puts "Please enter your address or zip-code to find local Fireside Gatherings:"
    user_input = gets.strip
    FiresideFinder::CLI.print_all(user_input)
    FiresideFinder::CLI.menu
  end

  def list_local
    @local_gatherings = Scraper::scrape_list
  end

  def self.menu
    while @user_input != "exit"
      @user_input = gets.strip
      case @user_input
      when "list"
        FiresideFinder::CLI.call
      when "1"
        puts "more info on 1"
      when "2"
        puts "more info on 2"
      when "exit"
        puts "See you at the Tavern!"
        exit
      end
    end
  end

  def self.print_all(user_input)
    FiresideFinder::Scraper::scrape_list(user_input)
    counter = 0
    FiresideFinder::Gathering.all.each do |gather|
      counter += 1
      puts counter
      gather.inspect.split('@').each do |detail|
        puts detail
      end
    end
    puts "Enter the number above the event you'd like more info on"
    puts "Or enter list to put in a new location, exit to close the program:"
  end

  def self.print_specific(user_input)
    FiresideFinder::Scraper::scrape_specific(user_input)
  end
end
binding.pry
