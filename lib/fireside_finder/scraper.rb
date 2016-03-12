require_relative '../fireside_finder'
require 'nokogiri'
require 'pry'
require 'geocoder'
require 'httparty'

class FiresideFinder::Scraper
  attr_accessor :page, :parsed

  def self.scrape_list
    @page = HTTParty.get('http://us.battle.net/hearthstone/en/fireside-gatherings?lat=40.7127837&lng=-74.00594130000002')
    @parsed = Nokogiri::HTML(@page)

    FiresideFinder::Gathering::reset

     @parsed.css('.meetups-event-table__row:not(:first-child)').each do |event_detail|
       new_gathering = FiresideFinder::Gathering.new
       new_gathering.name = event_detail.css('.meetups-event-table__cell__name').children.text
       new_gathering.city = event_detail.css('.meetups-event-table__cell__city').text
       new_gathering.date = event_detail.css('.meetups-event-table__cell--time').text.strip
       event_link = @parsed.css('.meetups-event-table__row').css('a').map {|link| link['href']}[0]
       new_gathering.details_link = "http://us.battle.net"+"#{event_link}"
       new_gathering.save
     end
  end

  def self.scrape_specific
    @page = HTTParty.get('http://us.battle.net/hearthstone/en/fireside-gatherings/17088')
    @parsed = Nokogiri::HTML(@page)

    FiresideFinder::Gathering::reset
    new_gathering = FiresideFinder::Gathering.new
    new_gathering.name = @parsed.css('.meetup-header__title').text.strip
    new_gathering.venue = @parsed.css('.location-address').css('h4').text
    new_gathering.address = @parsed.css('.location-address').css('p').text
    new_gathering.datetime = @parsed.css('.details-start-date').text.strip
    new_gathering.description = @parsed.css('.description:first-of-type').css('p:first-of-type').text.gsub! "\r" "\n", ""
    new_gathering.directions = @parsed.css('.map-container span').css('a').map { |link| link['href'] }[0]
    new_gathering.save
  end
end

#binding.pry
# format for complete url: http://us.battle.net/hearthstone/en/fireside-gatherings?lat=29.2784215&lng=-94.83650940000001
