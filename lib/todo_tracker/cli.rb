# frozen_string_literal: true

require "thor"

module TodoTracker
  # Handle the application command line parsing
  # and the dispatch to various command objects
  #
  # @api public
  class CLI < Thor
    # Error raised by this runner
    Error = Class.new(StandardError)

    desc "version", "todo_tracker version"
    def version
      require_relative "version"
      puts "v#{TodoTracker::VERSION}"
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
        TodoTracker::Commands::Analyze.new(path, options).execute
      end
    end
  end
end
