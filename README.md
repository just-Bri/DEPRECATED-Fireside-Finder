# FiresideFinder

This is a simple ruby gem to find local Fireside Gatherings for Hearthstone. Information is scraped from http://us.battle.net/hearthstone/en/fireside-gatherings

## Installation
This gem has outside dependencies see [#Dependencies](https://github.com/reifnotreef/fireside-finder#Dependencies).

    $ gem install fireside-finder

## Usage

Once installed simply run fireside-finder in your cli and follow the prompts.

    $ fireside-finder

## Dependencies
This gem require the following external gems:
[bundler](https://rubygems.org/gems/bundler)
[rake](https://rubygems.org/gems/rake)
[rspec](https://rubygems.org/gems/rspec)
[pry](https://rubygems.org/gems/pry)
[nokogiri](https://rubygems.org/gems/nokogiri)
[geocoder](https://rubygems.org/gems/geocoder)
[httparty](https://rubygems.org/gems/httparty)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/reifnotreef/fireside-finder. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
