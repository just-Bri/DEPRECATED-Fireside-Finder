# our CLI Controller
require_relative '../fireside_finder'
require_relative 'geocoder'
require_relative 'scraper'
require 'nokogiri'
require 'pry'
require 'geocoder'
require 'httparty'

class FiresideFinder::CLI
  attr_accessor :user_input, :geoaddress, :specific_event, :current_gatherings

  def self.call
    puts "Use 'new' to get back to this menu, 'exit' will close the program."
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
      when "new"
        FiresideFinder::CLI.call
      when "1"
        @specific_event = @current_gatherings[@user_input.to_i - 1]
        FiresideFinder::CLI.print_specific(@specific_event.details_link)
      when "2"
        puts "more info on 2"
      when "3"
        puts "more info on 3"
      when "4"
        puts "more info on 4"
      when "5"
        puts "more info on 5"
      when "6"
        puts "more info on 6"
      when "7"
        puts "more info on 7"
      when "8"
        puts "more info on 8"
      when "9"
        puts "more info on 9"
      when "10"
        puts "more info on 10"
      when "11"
        puts "more info on 11"
      when "12"
        puts "more info on 12"
      when "exit"
        puts "See you at the Tavern!"
        exit
      when ""
        FiresideFinder::CLI.call
      end
    end
  end

  def self.print_all(user_input)
    FiresideFinder::Scraper::scrape_list(user_input)
    counter = 0
    @current_gatherings = Array.new
    FiresideFinder::Gathering.all.each do |gather|
      counter += 1
      @current_gatherings << gather
      puts counter
      gather.inspect.split('@').each do |detail|
        puts detail
      end
    end
    puts "Enter the number above the event you'd like more info about."
    puts "Or enter 'new' to put in a new location, 'exit' to close the program:"
  end

  def self.print_specific(specific_event)
    FiresideFinder::Scraper::scrape_specific(@specific_event)
    FiresideFinder::Gathering.all.each do |gather|
      gather.inspect.split('@').each do |detail|
        puts detail
      end
    end
    FiresideFinder::CLI.call
  end
end
binding.pry
