# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lotus-controller'

Gem::Specification.new do |gem|
  gem.name          = "lotus-controller"
  gem.version       = Lotus::Controller::VERSION
  gem.authors       = ["Luca Guidi"]
  gem.email         = ["me@lucaguidi.com"]
  gem.description   = %q{Lotus Controller layer}
  gem.summary       = %q{Controller layer for Lotus}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'rack'
  gem.add_dependency 'rack-mount'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'rspec', '~> 2.12'
end
