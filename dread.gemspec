$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "dread/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "dread"
  s.version     = Dread::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "https://github.com/DamirSvrtan/dread"
  s.summary     = "Summary of Dread."
  s.description = "Description of Dread."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.6"

  s.add_development_dependency "sqlite3"
end
