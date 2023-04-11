# frozen_string_literal: true

require "English"
require_relative "regex_builder"
require_relative "../comment"

module TodoAgent
  module Parsers
    class Ruby
      def self.parse(file)
        regex_str = TodoAgent::Parsers::RegexBuilder.regex
        regexp = Regexp.new("^\\s*##{regex_str}$", Regexp::MULTILINE | Regexp::IGNORECASE)
        comments = []

        # TODO: This logic belongs out of the specific ruby parser
        # This only matches single line.
        IO.foreach(file) do |line|
          match = regexp.match(line)
          comments << TodoAgent::Comment.new(match, file, $INPUT_LINE_NUMBER) if match
        end

        comments
      end
    end
  end
end
