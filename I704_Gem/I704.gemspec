# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'I704/version'

Gem::Specification.new do |spec|
  spec.name          = "I704"
  spec.version       = I704::VERSION
  spec.authors       = ["ccataldo345"]
  spec.email         = ["christian.cataldo@itcollege.ee"]

  spec.summary       = %q{news.err.ee web scraping}
  spec.description   = %q{scrape news title from webpage}
  spec.homepage      = "https://github.com/ccataldo345/I704-Ruby-spring-2017-.git"
  spec.homepage      = "https://github.com/ccataldo345/I704-Ruby-spring-2017-.git"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "sinatra", "~> 1.4.8"
  spec.add_development_dependency "httparty", "~> 0.14.0"
  spec.add_development_dependency "nokogiri", "~> 1.7.0.1"
end
