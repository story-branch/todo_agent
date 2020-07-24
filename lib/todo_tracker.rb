# frozen_string_literal: true

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
      next unless parser

      parser_class = Object.const_get("TodoTracker::Parsers::#{parser}")
      result = parser_class.parse(filepath)
      comments += result
    end

    output(comments)
    nil
  end

  def self.output(comments, output_file = "todo_tracker.log")
    File.open(output_file, "w") do |f|
      comments.each do |comment|
        f.write "#{comment}\n"
      end
    end
  end
end
