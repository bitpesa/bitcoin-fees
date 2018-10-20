# Bitcoin::Fees

A simple API wrapper to access the https://bitcoinfees.earn.com in Ruby.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bitcoin-fees'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bitcoin-fees

## Usage

Create a reusable client that will make requests to the API:

```ruby
client = Bitcoin::Fees.configure
```

Supported endpoints

List: This will show all of the fee spreads along with the mining times for those spreads.
```ruby
client.list

=> {"fees"=>[{"minFee"=>0, "maxFee"=>0, "dayCount"=>4, "memCount"=>0, "minDelay"=>37, "maxDelay"=>10000, "minMinutes"=>300, "maxMinutes"=>10000}, {"minFee"=>1, "maxFee"=>2, "dayCount"=>22384, "memCount"=>1760, "minDelay"=>0, "maxDelay"=>3, "minMinutes"=>0, "maxMinutes"=>70}, {"minFee"=>3, "maxFee"=>4, "dayCount"=>50632, "memCount"=>820, "minDelay"=>0, "maxDelay"=>2, "minMinutes"=>0, "maxMinutes"=>45}, {"minFee"=>5, "maxFee"=>6, "dayCount"=>25137, "memCount"=>429, "minDelay...
```

Recommended: This breaks down the fee suggestings into three categories based on the infomation from the list method. This will provide the minimum suggested fee in order to acheive a transaction being mined within the timeframes returned.

```ruby
client.recommended

=> {"fastestFee"=>8, "halfHourFee"=>8, "hourFee"=>4}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/CallumD/bitcoin-fees. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Bitcoin::Fees project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/CallumD/bitcoin-fees/blob/master/CODE_OF_CONDUCT.md).
