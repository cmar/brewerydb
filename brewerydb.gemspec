# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "brewerydb/version"

Gem::Specification.new do |s|
  s.name        = "brewerydb"
  s.version     = Brewerydb::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Chris Mar"]
  s.email       = ["chris@hopshunter.com"]
  s.homepage    = "http://www.hopshunter.com"
  s.summary     = %q{Simple Wrapper around the BreweryDB API}
  s.description = %q{Free Beer data. You'll need an api key.}

  s.rubyforge_project = "brewerydb"

  s.add_dependency('httparty', '>= 0.7.3')
  s.add_dependency('hashie', '>= 1.0.0')
  
  s.add_development_dependency('rspec')
    
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
