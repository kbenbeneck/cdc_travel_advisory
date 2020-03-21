require_relative 'lib/cdc_travel_advisory/version'

Gem::Specification.new do |spec|
  spec.name          = "cdc_travel_advisory"
  spec.version       = CdcTravelAdvisory::VERSION
  spec.authors       = ["KBENBENECK"]
  spec.email         = ["kbenbeneck@gmail.com"]

  spec.summary       = "CDC Travel Health Notices"
  spec.description   = "CLI provides a list of issues, destinations, last update, and other specific information."
  spec.homepage      = "http://rubygems.org/gems/cdc_travel_advisory"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://github.com/kbenbeneck/cdc_travel_advisory"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/kbenbeneck/cdc_travel_advisory"
  spec.metadata["changelog_uri"] = "https://github.com/kbenbeneck/cdc_travel_advisory/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"

  
  
end