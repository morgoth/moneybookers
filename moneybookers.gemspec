# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "moneybookers/version"

Gem::Specification.new do |s|
  s.name        = "moneybookers"
  s.version     = Moneybookers::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Wojciech Wnętrzak"]
  s.email       = ["w.wnetrzak@gmail.com"]
  s.homepage    = "https://github.com/morgoth/moneybookers"
  s.summary     = %q{Ruby client for Moneybookers}
  s.description = %q{Ruby client for Moneybookers Automated Payment Interface and Payment Gateway}

  s.rubyforge_project = "moneybookers"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency("fakeweb")
end
