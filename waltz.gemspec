# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "waltz/version"

Gem::Specification.new do |s|
  s.name        = "waltz"
  s.version     = Waltz::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Pete Yandell"]
  s.email       = ["pete@notahat.com"]
  s.homepage    = ""
  s.summary     = %q{Experiment in deployment tools.}
  s.description = %q{Experiment in deployment tools, taking ideas from babushka and elsewhere.}

  s.rubyforge_project = "waltz"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
