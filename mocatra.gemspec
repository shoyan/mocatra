# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mocatra/version'

Gem::Specification.new do |spec|
  spec.name          = "mocatra"
  spec.version       = Mocatra::VERSION
  spec.authors       = ["Shohei Yamasaki"]
  spec.email         = ["yamasaki0406@gmail.com"]

  spec.summary       = %q{Mocatra is mock server with sinatra}
  spec.homepage      = "https://github.com/shoyan/mocatra.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "sinatra"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rack-test"
end
