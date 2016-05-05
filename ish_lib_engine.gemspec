$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ish_lib_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ish_lib_engine"
  s.version     = IshLibEngine::VERSION
  s.authors     = ["Victor Piousbox"]
  s.email       = ["piousbox@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of IshLibEngine."
  s.description = "Description of IshLibEngine."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib,spec}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.6"
  s.add_dependency 'mongoid'
  s.add_dependency 'devise'
  s.add_dependency 'simple-rss'
  s.add_dependency 'htmlentities'
  s.add_dependency 'resque'
  
  s.add_development_dependency "sqlite3"
end
