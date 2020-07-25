# frozen_string_literal: true

require "rake"
require_relative "../command"
require_relative "../file_identifier"
# TODO: load remaining parsers
require_relative "../parsers/ruby"

module TodoAgent
  module Commands
    class Analyze < TodoAgent::Command
      def initialize(path, options)
        @path = path
        @options = options
      end

      def execute(_input: $stdin, _output: $stdout)
        comments = []
        Rake::FileList["#{@path}/**/*"].exclude(paths_to_ignore).each do |filepath|
          parser = TodoAgent::FileIdentifier.based_on_file_extension(filepath)
          next unless parser

          parser_class = Object.const_get("TodoAgent::Parsers::#{parser}")
          result = parser_class.parse(filepath)
          comments += result
        end

        output(comments)
        nil
      end

      private

      def paths_to_ignore
        return [] if @options["ignore_paths"].nil?

        @options["ignore_paths"].map do |ignore_path|
          next ignore_path if ignore_path.start_with?(@path)

          "#{@path}/ignore_path"
        end
      end

      def output(comments)
        File.open(output_file, "w") do |f|
          comments.each do |comment|
            f.write "#{comment}\n"
          end
        end
      end

      def output_file
        @options["output_file"] || "todo_agent.log"
      end
    end
  end
end
