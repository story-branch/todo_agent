# TodoTracker

Searches the code for TODOs and creates issues in the configured tracker

This is the initial description of the concept and it will probably evolve with the requirements.

Initial concept is to look for a list of regex (preferably configurable) and create issues in a configured tracker or if no tracker is configured, output the result into a log file.

Might be interesting to extract some of the features from story_branch gem to a separate gem that will handle the wrapping of the API and so on, so we can easily use those functionalities here as well. Probably will start with a copy paste of the needed code and when the patterns are clearer then extract them to separate gems.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'todo_tracker'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install todo_tracker

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rpbaltazar/todo_tracker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/rpbaltazar/todo_tracker/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TodoTracker project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/rpbaltazar/todo_tracker/blob/master/CODE_OF_CONDUCT.md).
