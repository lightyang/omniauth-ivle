# coding: utf-8
require File.expand_path("../lib/omniauth/ivle/version", __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "omniauth-ivle"
  spec.version       = Omniauth::IVLE::VERSION
  spec.authors       = ["Mansheng Yang"]
  spec.email         = ["lightyang0@gmail.com"]
  spec.description   = %q{An OmniAuth strategy for implementing IVLE login}
  spec.summary       = %q{An OmniAuth strategy for IVLE}
  spec.homepage      = "https://github.com/lightyang/omniauth-ivle"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "omniauth", "~> 1.0"
  spec.add_dependency "faraday"
  spec.add_dependency "multi_json"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
