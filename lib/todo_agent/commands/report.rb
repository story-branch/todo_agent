# frozen_string_literal: true

require "rake"
require_relative "../command"

module TodoAgent
  module Commands
    class Report < TodoAgent::Command
      def initialize(path, options)
        @path = path
        @options = options
        @run_ts = Time.now.strftime("%Y%m%d_%H%M%S")
      end

      def execute(_input: $stdin, _output: $stdout)
        comments = TodoAgent::CommentFinder.new(path: path, paths_to_ignore: paths_to_ignore).run
        report_comments(comments)
      end

      private

      def paths_to_ignore
        return [] if @options["ignore_paths"].nil?

        @options["ignore_paths"].map do |ignore_path|
          next ignore_path if ignore_path.start_with?(@path)

          "#{@path}/ignore_path"
        end
      end

      def report_comments(comments)
        comments.each do |comment|
          p "Reporting" unless comment.tracked?
        end
      end
    end
  end
end
