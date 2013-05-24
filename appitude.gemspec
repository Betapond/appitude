# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'appitude/version'

Gem::Specification.new do |gem|
  gem.name          = "appitude"
  gem.version       = Appitude::VERSION
  gem.authors       = ["John Butler"]
  gem.email         = ["johnnypez@gmail.com"]
  gem.description   = %q{A little bit of structure for our apps}
  gem.summary       = %q{A little bit of structure for our apps}
  gem.homepage      = "https://github.com/johnnypez/appitude"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'jquery-rails'
  gem.add_dependency 'coffee-rails'
  gem.add_dependency 'backbone-rails', '~> 1.0'
end
