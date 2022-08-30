# frozen_string_literal: true

require_relative "file_identifier"
# TODO: load remaining parsers
require_relative "parsers/ruby"

module TodoAgent
  class CommentFinder
    # returns Array of Comments
    def initialize(path:, paths_to_ignore:)
      @path = path || "."
      @paths_to_ignore = paths_to_ignore || []
      @comments = []
    end

    def run
      return @comments unless @comments.empty?

      Rake::FileList["#{@path}/**/*"].exclude(@paths_to_ignore).each do |filepath|
        parser = TodoAgent::FileIdentifier.based_on_file_extension(filepath)
        next unless parser

        parser_class = Object.const_get("TodoAgent::Parsers::#{parser}")
        result = parser_class.parse(filepath)
        @comments += result
      end
    end
  end
end
