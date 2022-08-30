# frozen_string_literal: true

require "rake"
require_relative "../command"
require_relative "../comment_finder"

module TodoAgent
  module Commands
    class Analyze < TodoAgent::Command
      def initialize(path, options)
        @path = path
        @options = options
        @run_ts = Time.now.strftime("%Y%m%d_%H%M%S")
      end

      def execute(_input: $stdin, _output: $stdout)
        comments = TodoAgent::CommentFinder.new(path: path, paths_to_ignore: paths_to_ignore).run
        append_to_output(comments)
      end

      private

      def paths_to_ignore
        return [] if @options["ignore_paths"].nil?

        @options["ignore_paths"].map do |ignore_path|
          next ignore_path if ignore_path.start_with?(@path)

          "#{@path}/ignore_path"
        end
      end

      def append_to_output(comments)
        File.open(output_file_name, "a") do |f|
          comments.each do |comment|
            f.write "#{comment}\n"
          end
        end
      end

      def output_file_name
        @output_file_name ||= @options["output_file"] || "todo_agent_#{@run_ts}.log"
      end
    end
  end
end
