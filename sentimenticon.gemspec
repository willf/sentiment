# frozen_string_literal: true

require_relative "lib/sentimenticon"

Gem::Specification.new do |spec|
  spec.name          = "sentimenticon"
  spec.version       = Sentimenticon::VERSION
  spec.authors       = ["Will Fitzgerald"]
  spec.email         = ["will.fitzgerald@pobox.com"]

  spec.summary       = "Word level sentiment analyzer."
  spec.description   = "Word level sentiment analyzer, currently English only"
  spec.homepage      = "https://github.com/willf/sentimenticon_rb"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/willf/sentimenticon_rb"
  spec.metadata["changelog_uri"] = "https://github.com/willf/sentimenticon_rb/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "data"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  spec.add_development_dependency "rspec", "~> 3.2"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
