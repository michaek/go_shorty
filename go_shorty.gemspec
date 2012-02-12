# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "go_shorty/version"

Gem::Specification.new do |s|
  s.name        = "go_shorty"
  s.version     = GoShorty::VERSION
  s.authors     = ["Michael Hellein"]
  s.email       = [""]
  s.homepage    = ""
  s.summary     = %q{TODO: go_shorty}
  s.description = %q{TODO: go_shorty}

  # s.rubyforge_project = "go_shorty"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "rack-test"
  s.add_development_dependency "sqlite3"
  s.add_runtime_dependency "sinatra"
  s.add_runtime_dependency "activerecord"
  s.add_runtime_dependency "sinatra-activerecord"
  s.add_runtime_dependency "haml"
  s.add_runtime_dependency "base58"
end
