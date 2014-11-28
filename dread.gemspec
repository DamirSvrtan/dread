$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "dread/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "dread"
  s.version     = Dread::VERSION
  s.authors     = ["Damir Svrtan"]
  s.email       = ["damir.svrtan@gmail.com"]
  s.homepage    = "https://github.com/DamirSvrtan/dread"
  s.summary     = "Draw a graph of dependently destroyable associations."
  s.description = "Draw a graph of dependently destroyable associations and never dread about destroying your records again!"
  s.license     = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency "rails", ">= 3.2.0"
  s.add_dependency "colorize", '0.7.3'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "appraisal"
end
