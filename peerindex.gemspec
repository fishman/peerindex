# encoding: utf-8
require File.expand_path('../lib/peerindex/version', __FILE__)

Gem::Specification.new do |gem|
  gem.add_dependency 'hashie', '~> 1.1.0'
  gem.add_dependency 'faraday', '~> 0.7.4'
  gem.add_dependency 'faraday_middleware', '~> 0.7.0'
  gem.add_dependency 'multi_json', '~> 1.0.0'
  gem.add_dependency 'multi_xml', '~> 0.4.0'
  gem.add_dependency 'simple_oauth', '~> 0.1.5'
  gem.add_development_dependency 'nokogiri', '~> 1.4'
  gem.add_development_dependency 'rake', '~> 0.9'
  gem.add_development_dependency 'rdiscount', '~> 1.6'
  gem.add_development_dependency 'rspec', '~> 2.6'
  gem.add_development_dependency 'simplecov', '~> 0.4'
  gem.add_development_dependency 'webmock', '~> 1.7'
  gem.add_development_dependency 'yard', '~> 0.7'
  gem.authors = ["Reza Jelveh"]
  gem.description = %q{A Ruby wrapper for the Peerindex API}
  gem.email = ['reza.jelveh@tuhh.de']
  gem.executables = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  gem.files = `git ls-files`.split("\n")
  gem.homepage = 'https://github.com/fishman/peerindex'
  gem.name = 'peerindex'
  gem.require_paths = ['lib']
  gem.required_rubygems_version = Gem::Requirement.new('>= 1.3.6')
  gem.summary = %q{Ruby wrapper for the Peerindex API}
  gem.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.version = Peerindex::VERSION.dup
end
