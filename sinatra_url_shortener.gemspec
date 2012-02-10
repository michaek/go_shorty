# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sinatra_url_shortener/version"

Gem::Specification.new do |s|
  s.name        = "sinatra_url_shortener"
  s.version     = SinatraUrlShortener::VERSION
  s.authors     = ["Michael Hellein"]
  s.email       = [""]
  s.homepage    = ""
  s.summary     = %q{TODO: sinatra_url_shortener}
  s.description = %q{TODO: sinatra_url_shortener}

  # s.rubyforge_project = "sinatra_url_shortener"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_runtime_dependency "sinatra"
  s.add_runtime_dependency "activerecord"
  s.add_runtime_dependency "sinatra-activerecord"
  s.add_runtime_dependency "base58"
end
