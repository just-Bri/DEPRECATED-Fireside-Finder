# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'fireside-finder/version'
# gem 'nokogiri'
# gem 'pry'
# gem 'geocoder'
# gem 'httparty'
require 'nokogiri'
require 'pry'
require 'geocoder'
require 'httparty'

Gem::Specification.new do |spec|
  spec.name          = "fireside-finder"
  spec.version       = FiresideFinder::VERSION
  spec.author        = ["reifnotreef"]
  spec.authors       = ["reifnotreef"]
  spec.email         = ["bridgerrhammond@gmail.com"]
  spec.license       = "Apache-2.0"

  spec.summary       = "Find local Hearthstone Fireside Gatherings."
  spec.description   = "Put in your address of zip-code to find local Fireside Gatherings!"
  spec.homepage      = "https://github.com/reifnotreef/fireside-finder"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["fireside-finder"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "geocoder"
  spec.add_development_dependency "httparty"
end
