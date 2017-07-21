$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "spina/case_studies/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "spina-case-studies"
  s.version     = Spina::CaseStudies::VERSION
  s.authors     = ["Tom Simnett"]
  s.email       = ["tom@initforthe.com"]
  s.homepage    = "https://github.com/initforthe/spina-case-studies"
  s.summary     = "Case Studies manager for Spina CMS"
  s.description = "Add Case Studies in Spina CMS"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_runtime_dependency 'spina', '~> 0.11', '>= 0.11.1'
  s.add_runtime_dependency 'friendly_id', '~> 5.2', '>= 5.2.1'

  s.add_development_dependency 'sqlite3', '~> 1.3.13', '>= 1.3.13'
  s.add_development_dependency 'simplecov', '~> 0'
  s.add_development_dependency 'rspec-rails', '~> 3.6.0', '>= 3.6.0'
  s.add_development_dependency "factory_girl_rails", "~> 4.0"
  s.add_development_dependency 'pry-rails', '~> 0'
  s.add_development_dependency 'rails-controller-testing', '~> 1.0.2', '>= 1.0.2'
  s.add_development_dependency 'capybara', '~> 2.14.3', '>= 2.14.3'
end
