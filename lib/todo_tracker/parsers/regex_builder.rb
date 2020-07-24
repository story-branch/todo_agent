# frozen_string_literal: true

require_relative "default_tags"

module TodoTracker
  module Parsers
    class RegexBuilder
      DEFAULT_TAGS = [DefaultTags.todo, DefaultTags.fixme].freeze

      def self.regex(custom_tags = [])
        tags = (DEFAULT_TAGS + custom_tags).uniq

        # Regex building taken from https://github.com/pgilad/leasot/blob/ffc68de48d91f6b0d4ba35d6a21b4fb3580b54f9/src/lib/utils/comments.ts
        # Optional space.
        '\\s*' +
          # Optional `@`.
          "@?" +
          # One of the keywords such as `TODO` and `FIXME`.
          "(" +
          tags.join("|") +
          ")" +
          # tag cannot be followed by an alpha-numeric character (strict tag match)
          '(?!\\w)' +
          # Optional space.
          '\\s*' +
          # Optional leading reference in parenthesis.
          '(?:\\(([^)]*)\\))?' +
          # Optional space.
          '\\s*' +
          # Optional colon `:`.
          ":?" +
          # Optional space.
          '\\s*' +
          # Comment text.
          "(.*?)" +
          # Optional trailing reference after a space and a slash, followed by an optional space.
          '(?:\\s+/([^\\s]+)\\s*)?'
      end
    end
  end
end
