# frozen_string_literal: true

require 'byebug'

module TodoAgent
  class Comment
    attr_reader :line, :filename

    def initialize(match, filename, line)
      Kernel.byebug
      @filename = filename
      @match = match
      @line = line
    end

    def tag
      @match[1]
    end

    def to_s
      "Matched: #{tag} in #{filename} at line #{line}\nMATCH: #{@match}\n\n"
    end
  end
end
