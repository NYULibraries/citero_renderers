$:.push File.expand_path("../lib", __FILE__)

require "citero_renderers/version"

Gem::Specification.new do |s|
  s.name        = "citero_renderers"
  s.version     = CiteroRenderers::VERSION
  s.authors     = ["hab278"]
  s.email       = ["hab278@nyu.edu"]
  s.date        = "2015-1-30"
  s.summary     = "Renderers for some citero objects."
  s.description = "Renders citero objects for Rails applications."
  s.homepage    = "https://github.com/NYULibraries/citero_renderers"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '>= 3.0'
  s.add_dependency "citero-jruby", "~> 2.0"

  s.add_development_dependency "activerecord-jdbcsqlite3-adapter"
  s.add_development_dependency('rspec-rails', '>= 2.12')
  s.add_development_dependency('acts_as_citable')
end
