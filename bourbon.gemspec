# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bourbon/version"

Gem::Specification.new do |s|
  s.name        = "bourbon"
  s.version     = Bourbon::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Bob Nadler, Jr."]
  s.email       = ["bnadlerjr@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{HTML form helpers for Sinatra.}
  s.description = %q{HTML form helpers for Sinatra.}

  s.rubyforge_project = "bourbon"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
