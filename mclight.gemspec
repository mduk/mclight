# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mclight/version'

Gem::Specification.new do |spec|
  spec.name          = "mclight"
  spec.version       = Mclight::VERSION
  spec.authors       = ["Daniel Kendell"]
  spec.email         = ["daniel@kendell.org"]
  spec.summary       = %q{My Minecraft Light}
  spec.description   = %q{My Fuckin' Minecraft Light.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = [ 'mclight' ]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'minecraft-query', '~> 1.0.0'
  spec.add_dependency 'wiringpi', '~> 1.1.0'
  spec.add_dependency 'ruby-mpd', '~> 0.3.0'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
