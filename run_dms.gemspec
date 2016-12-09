# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'run_dms/version'

Gem::Specification.new do |spec|
  spec.name          = "RunDMS"
  spec.version       = RunDMS::VERSION
  spec.authors       = ["Randy Schmidt"]
  spec.email         = ["me@r38y.com"]

  spec.summary       = %q{Wrapper for reporting to Dead Man's Snitch}
  spec.homepage      = "https://github.com/r38y/run_dms"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
