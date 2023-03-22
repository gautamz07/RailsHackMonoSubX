$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "saddlebag/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "saddlebag"
  spec.version     = Saddlebag::VERSION
  spec.authors     = ["gautamgoshopmatic"]
  spec.email       = ["gautam.fonseca@goshopmatic.com"]
  spec.homepage    = "http://website.com"
  spec.summary     = "Write a short summary, because Rubygems requires one."
  spec.description = "Write a short summary, because Rubygems requires one."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.2.8"
  spec.add_dependency "webpacker", "~> 5.4.3"
end
