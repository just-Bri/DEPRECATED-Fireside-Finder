# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fireside_finder/version'
gem 'nokogiri'
gem 'pry'
gem 'geocoder'
gem 'httparty'

Gem::Specification.new do |spec|
  spec.name          = "fireside_finder"
  spec.version       = FiresideFinder::VERSION
  spec.author        = ["reifnotreef"]
  spec.authors       = ["reifnotreef"]
  spec.email         = ["bridgerrhammond@gmail.com"]
  spec.license       = "Apache-2.0"

  spec.summary       = "Find local Fireside Gatherings."
  spec.description   = ""
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "geocoder"
  spec.add_development_dependency "httparty"
end
