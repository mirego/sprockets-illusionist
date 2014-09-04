# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sprockets_illusionist/version'

Gem::Specification.new do |spec|
  spec.name          = 'sprockets-illusionist'
  spec.version       = SprocketsIllusionist::VERSION
  spec.authors       = ['Charles Demers']
  spec.email         = ["cdemers@mirego.com"]
  spec.summary       = 'Transpile your ES6 files into ES5 using the Illusionist node module and Sprockets'
  spec.description   = 'Transpile your ES6 files into ES5 using the Illusionist node module and Sprockets'
  spec.homepage      = 'https://github.com/mirego/sprockets-illusionist'
  spec.license       = 'BSD 3-Clause'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_dependency 'sprockets', '>= 2.10.1', '< 3.0'
end
