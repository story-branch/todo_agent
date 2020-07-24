# frozen_string_literal: true

module TodoTracker
  class Comment
    attr_reader :line, :filename

    def initialize(match, filename, line)
      @filename = filename
      @match = match
      @line = line
    end

    def tag
      @match[1]
    end

    def to_s
      "Matched: #{tag} in #{filename} at line #{line}"
    end
  end
end
