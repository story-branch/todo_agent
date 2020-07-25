# frozen_string_literal: true

module TodoAgent
  class FileIdentifier
    def self.based_on_file_extension(filename)
      supported_files = {
        ".rb" => "Ruby"
      }

      extname = File.extname(filename)
      supported_files[extname]
    end
  end
end
