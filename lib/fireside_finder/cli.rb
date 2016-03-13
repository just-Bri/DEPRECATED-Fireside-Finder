# our CLI Controller
require_relative '../fireside_finder'
require_relative 'geocoder'
require_relative 'scraper'
require 'pry'

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
      # when @user_input.is_a?(Integer)
      #   @specific_event = @current_gatherings[@user_input.to_i - 1]
      #   FiresideFinder::CLI.print_specific(@specific_event.details_link)
      # when "2"
      #   @specific_event = @current_gatherings[@user_input.to_i - 1]
      #   FiresideFinder::CLI.print_specific(@specific_event.details_link)
      # when "3"
      #   @specific_event = @current_gatherings[@user_input.to_i - 1]
      #   FiresideFinder::CLI.print_specific(@specific_event.details_link)
      # when "4"
      #   @specific_event = @current_gatherings[@user_input.to_i - 1]
      #   FiresideFinder::CLI.print_specific(@specific_event.details_link)
      # when "5"
      #   @specific_event = @current_gatherings[@user_input.to_i - 1]
      #   FiresideFinder::CLI.print_specific(@specific_event.details_link)
      # when "6"
      #   @specific_event = @current_gatherings[@user_input.to_i - 1]
      #   FiresideFinder::CLI.print_specific(@specific_event.details_link)
      # when "7"
      #   @specific_event = @current_gatherings[@user_input.to_i - 1]
      #   FiresideFinder::CLI.print_specific(@specific_event.details_link)
      # when "8"
      #   @specific_event = @current_gatherings[@user_input.to_i - 1]
      #   FiresideFinder::CLI.print_specific(@specific_event.details_link)
      # when "9"
      #   @specific_event = @current_gatherings[@user_input.to_i - 1]
      #   FiresideFinder::CLI.print_specific(@specific_event.details_link)
      # when "10"
      #   @specific_event = @current_gatherings[@user_input.to_i - 1]
      #   FiresideFinder::CLI.print_specific(@specific_event.details_link)
      # when "11"
      #   @specific_event = @current_gatherings[@user_input.to_i - 1]
      #   FiresideFinder::CLI.print_specific(@specific_event.details_link)
      # when "12"
      #   @specific_event = @current_gatherings[@user_input.to_i - 1]
      #   FiresideFinder::CLI.print_specific(@specific_event.details_link)
      when "exit"
        puts "See you at the Tavern!"
        exit
      else
        @user_input = @user_input.to_i
        @specific_event = @current_gatherings[@user_input - 1]
        FiresideFinder::CLI.print_specific(@specific_event.details_link)
      # else
      #   puts "Not sure what you want, type 'new' to lookup a location"
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
    FiresideFinder::CLI.menu
  end

  def self.print_specific(specific_event)
    FiresideFinder::Scraper::scrape_specific(@specific_event)
    FiresideFinder::Gathering.all.each do |gather|
      gather.inspect.split('@').each do |detail|
        puts detail
      end
    end
    puts "Enter the number above the event you'd like more info about."
    FiresideFinder::CLI.menu
  end
end
binding.pry
