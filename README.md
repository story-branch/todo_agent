# todo-tracker
Searches the code for TODOs and creates issues in the configured tracker

This is the initial description of the concept and it will probably evolve with
the requirements.

Initial concept is to look for a list of regex (preferably configurable) and
create issues in a configured tracker or if no tracker is configured,
output the result into a log file.

Might be interesting to extract some of the features from story_branch gem to a
separate gem that will handle the wrapping of the API and so on, so we can
easily use those functionalities here as well. Probably will start with a copy
paste of the needed code and when the patterns are clearer then extract them to
separate gems.
