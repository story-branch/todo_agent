# frozen_string_literal: true

module TodoTracker
  module Parsers
    class DefaultTags
      # TODO: read from config or fallback to defaults
      def self.todo
        "TODO"
      end

      def self.fixme
        "FIXME"
      end
    end
  end
end
