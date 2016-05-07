$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'fastread/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'fastread'
  s.version     = Fastread::VERSION
  s.authors     = %w(sovetnik MistaTwista)
  s.email       = ['']
  s.homepage    = 'TODO'
  s.summary     = 'TODO: Summary of Fastread.'
  s.description = 'TODO: Description of Fastread.'
  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.executables   = ['fastread']
  s.require_paths = ['lib']

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end
