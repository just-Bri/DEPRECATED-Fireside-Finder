# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'fireside-finder/version'
# gem 'nokogiri'
# gem 'pry'
# gem 'geocoder'
# gem 'httparty'
# require 'nokogiri'
# require 'pry'
# require 'geocoder'
# require 'httparty'

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

  spec.add_runtime_dependency "bundler"
  spec.add_runtime_dependency "rake", ">=11.0.0"
  spec.add_runtime_dependency "rspec"
  spec.add_runtime_dependency "pry"
  spec.add_runtime_dependency "nokogiri"
  spec.add_runtime_dependency "geocoder"
  spec.add_runtime_dependency "httparty"
end
