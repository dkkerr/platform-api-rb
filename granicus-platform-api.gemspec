# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "granicus-platform-api/version"

Gem::Specification.new do |s|
  s.name = "granicus-platform-api"
  s.version     = GranicusPlatformAPI::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors = ["Javier Muniz", "Dan Melton"]
  s.email = "javier@granicus.com"
  s.summary = "Granicus Open Platform API 1.x Wrapper"
  s.homepage = "https://github.com/Granicus/platform-api-rb"
  s.description = "Wrapper for the Granicus Open Platform API v1.x"

  s.rubyforge_project = "granicus-platform-api"

  s.files        = Dir["{lib,spec}/**/*", "[A-Z]*"] - ["Gemfile.lock"]
  s.require_path = "lib"

  s.add_development_dependency('rspec', '~> 2.6')
  s.add_development_dependency('simplecov', '~> 0.5.0')
  s.add_development_dependency('hashie', '~> 1.2.0')
  s.add_development_dependency('savon', '~> 0.9.2')

  s.add_dependency('savon', '~> 0.9.2')
  # s.add_dependency('hashie', '~> 1.2.0')
  s.add_dependency('hashie', '~> 3.5.5')
end
