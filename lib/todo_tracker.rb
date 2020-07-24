# frozen_string_literal: true
require 'byebug'
require_relative "todo_tracker/version"
require_relative "todo_tracker/file_identifier"
require_relative "todo_tracker/parsers/ruby"

module TodoTracker
  class Error < StandardError; end
  # Your code goes here...

  # TODO: Should support excluding paths
  def self.run(path)
    comments = []
    Dir.glob("#{path}/**/*").each do |filepath|
      parser = TodoTracker::FileIdentifier.based_on_file_extension(filepath)
      puts "#{filepath} Not yet supported" unless parser
      next unless parser

      parser_class = Object.const_get("TodoTracker::Parsers::#{parser}")
      result = parser_class.parse(filepath)
      comments += result
    end

    puts comments
    nil
  end
end
