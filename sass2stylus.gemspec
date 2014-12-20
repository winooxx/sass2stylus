# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sass2stylus/version'

Gem::Specification.new do |spec|
  spec.name          = "sass2stylus"
  spec.version       = Sass2stylus::VERSION
  spec.authors       = ["Paul C Pederson"]
  spec.email         = ["paul.c.pederson@gmail.com"]
  spec.summary       = %q{Convert Sass to Stylus}
  spec.description   = %q{Convert any number of sass files to stylus files in a ruby script or on the command line.}
  spec.homepage      = "https://github.com/paulcpederson/sass2stylus"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ["sass2stylus"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "sass", '3.4.9'
end
