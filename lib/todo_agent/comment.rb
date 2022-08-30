# frozen_string_literal: true

module TodoAgent
  class Comment
    attr_reader :line, :filename, :tracked

    def initialize(match, filename, line)
      @filename = filename
      @match = match
      @line = line
      # TODO: update logic to identify if commented block is already tracked or not
      @tracked = false
    end

    def tracked?
      @tracked
    end

    def tag
      @match[1]
    end

    def to_s
      "Matched: #{tag} in #{filename} at line #{line}"
    end
  end
end
