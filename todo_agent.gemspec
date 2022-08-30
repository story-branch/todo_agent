# frozen_string_literal: true

require_relative "lib/todo_agent/version"

Gem::Specification.new do |spec|
  spec.name          = "todo_agent"
  spec.version       = TodoAgent::VERSION
  spec.authors       = ["Rui Baltazar"]
  spec.email         = ["rui.p.baltazar@gmail.com"]

  spec.summary       = "Transform tags into tickets"
  spec.description   = "Search for specific keywords in the codebase and create tickets in the tracker"
  spec.homepage      = "https://github.com/story-branch/todo_agent"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/story-branch/todo_agent/issues",
    "changelog_uri" => "https://github.com/story-branch/todo_agent/blob/master/Changelog.md",
    "documentation_uri" => "https://github.com/story-branch/todo_agent/blob/master/README.md",
    "source_code_uri" => "https://github.com/story-branch/todo_agent",
    "homepage_uri" => spec.homepage
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rake", "~> 13.0"

  spec.add_development_dependency "minitest", "~> 5.16"
  spec.add_development_dependency "minitest-reporters", "~> 1.5"
  spec.add_development_dependency "standard", "~> 1.15"
end
