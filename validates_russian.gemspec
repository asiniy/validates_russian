# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'validates_russian/version'

Gem::Specification.new do |spec|
  spec.name          = 'validates_russian'
  spec.version       = ValidatesRussian::VERSION
  spec.authors       = ['Alex Antonov']
  spec.email         = ['kaburbundokel11g@inbox.ru']
  spec.description   = %q{validates specific russian values}
  spec.summary       = %q{validates specific russian values}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~>1.3'
  spec.add_development_dependency 'rake'
end
