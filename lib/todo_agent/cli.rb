# frozen_string_literal: true

require "thor"

module TodoAgent
  # Handle the application command line parsing
  # and the dispatch to various command objects
  #
  # @api public
  class CLI < Thor
    # Error raised by this runner
    Error = Class.new(StandardError)

    desc "version", "todo_agent version"
    def version
      require_relative "version"
      puts "v#{TodoAgent::VERSION}"
    end
    map %w[--version -v] => :version

    desc "analyze PATH", "Runs through the tree from the passed path, searching for configured keywords and builds a log"
    method_option :help, aliases: "-h", type: :boolean, desc: "Display usage information"
    method_option :ignore_paths, aliases: "-I", type: :array, desc: "Paths to ignore while searching for keywords"
    method_option :output_file, aliases: "-o", type: :string, desc: "File to log the output"

    def analyze(path = ".")
      if options[:help]
        invoke :help, ["analyze"]
      else
        require_relative "commands/analyze"
        TodoAgent::Commands::Analyze.new(path, options).execute
      end
    end

    desc "report PATH", "Runs through the tree from the passed path and for each annotated block that does not have a ticket, creates one in the configured project"
    method_option :iterative, aliases: "-i", type: :boolean, desc: "For each annotated block asks which project to report to"
    method_option :diff, aliases: "--diff", type: :boolean, desc: "Runs report only on the touched files in comparison with main branch"

    def report(path = ".")
      require_relative "commands/report"
      TodoAgent::Commands::Report.new(path, options).execute
    end
  end
end
