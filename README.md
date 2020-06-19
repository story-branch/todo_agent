# todo-tracker

[![GitHub release](https://img.shields.io/github/release/story-branch/todo-tracker.svg)](https://github.com/story-branch/todo-tracker/releases)

Searches the code for TODOs and creates issues in the configured tracker

This is the initial description of the concept and it will probably evolve with
the requirements.

Initial concept is to look for a list of regex (preferably configurable) and
create issues in a configured tracker or if no tracker is configured, output the
result into a log file.

Might be interesting to extract some of the features from story_branch gem to a
separate gem that will handle the wrapping of the API and so on, so we can
easily use those functionalities here as well. Probably will start with a copy
paste of the needed code and when the patterns are clearer then extract them to
separate gems.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     todo-tracker:
       github: story-branch/todo-tracker
   ```

2. Run `shards install`

## Usage

```crystal
require "todo-tracker"
```

TODO: Write usage instructions here

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/story-branch/todo-tracker/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Rui Baltazar](https://github.com/rpbaltazar) - creator and maintainer
