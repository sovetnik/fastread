$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'fastread/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'fastread'
  s.version     = Fastread::VERSION
  s.authors     = %w(sovetnik MistaTwista)
  s.email       = ['']
  s.homepage    = 'http://fastread.com'
  s.summary     = 'Telegram bot for estimating time for articles in links'
  s.description = 'Fastread takes the link and answers with estimated time for reading text from that link'
  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.executables   = ['fastread']
  s.require_paths = ['lib']

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end
