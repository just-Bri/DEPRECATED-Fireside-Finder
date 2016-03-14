# our CLI Controller
require_relative '../fireside_finder'
require_relative 'geocoder'
require_relative 'scraper'
require 'pry'

class FiresideFinder::CLI
  attr_accessor :user_input, :geoaddress, :specific_event, :current_gatherings

  def self.call
    puts "--------------------------------------------------------------------------------"
    puts "Welcome to Hearthstone Fireside Gathering Finder Gem!"
    puts "--------------------------------------------------------------------------------"
    puts "Use 'new' to get back to this menu, 'exit' will close the program."
    puts "Please enter your address or zip-code to find local Fireside Gatherings:"
    user_input = gets.strip
    while user_input != "exit"
      FiresideFinder::CLI.print_all(user_input)
      FiresideFinder::CLI.menu
    end
    puts "See you at the Tavern, hero!"
  end

  def self.menu
    @user_input = nil
    while @user_input != "exit"
      @user_input = gets.strip
      if @user_input.to_i > 0
        FiresideFinder::CLI.print_specific(@current_gatherings[@user_input.to_i - 1])
      elsif @user_input == "new"
        FiresideFinder::Gathering.reset
        FiresideFinder::CLI.call
      elsif @user_input == "exit"
        puts "See you at the Tavern, hero!"
        exit
      else
        puts "Not sure what to do..."
        FiresideFinder::CLI.menu
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
      puts "--------------------------------------------------------------------------------"
      puts counter
      puts "Gathering Name:    #{gather.name}"
      puts "City:              #{gather.city}"
      puts "Date:              #{gather.date}"
      puts "Link to More Info: #{gather.details_link}"
      puts "--------------------------------------------------------------------------------"
    end
    puts ""
    puts "Enter the number above the event you'd like more info about."
    FiresideFinder::CLI.menu
  end

  def self.print_specific(specific_event)
    FiresideFinder::Scraper::scrape_specific(specific_event)
    puts "--------------------------------------------------------------------------------"
    FiresideFinder::Gathering.all.each do |gather|
      puts "--------------------------------------------------------------------------------"
      puts "Gathering Name:    #{gather.name}"
      puts "Venue:             #{gather.venue}"
      puts "Address:           #{gather.address}"
      puts "Date:              #{gather.datetime}"
      if gather.description != nil
        puts "Event Description: #{gather.description}"
      end
      puts "Directions:         #{gather.directions}"
      puts "--------------------------------------------------------------------------------"
    end
    puts "--------------------------------------------------------------------------------"
    puts "Enter 'new' to search a new area, or 'exit' to close the program."
    FiresideFinder::CLI.menu
  end
end
