# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'duedil/version'

Gem::Specification.new do |spec|
  spec.name          = "duedil-client"
  spec.version       = Duedil::VERSION
  spec.authors       = ["Anthony Laibe"]
  spec.email         = ["anthony@laibe.cc"]
  spec.summary       = %q{The duedil client provides a simple Ruby interface to the Duedil API.}
  spec.description   = %q{The duedil client provides a simple Ruby interface to the Duedil API.}
  spec.homepage      = "https://github.com/smartpension/duedil-client"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake",    "~> 10.4"
  spec.add_development_dependency "rspec",   "~> 3.2"

  spec.add_dependency "activesupport",       "~> 4.2"

end
