require_relative '../fireside_finder'
require 'nokogiri'
require 'pry'
require 'geocoder'
require 'httparty'

class FiresideFinder::Gathering
  attr_accessor :name, :venue, :city, :date, :datetime, :description, :address, :directions, :details_link
  @@all = []

  def initialize
    @name = name
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.reset
    @@all = []
  end
end
