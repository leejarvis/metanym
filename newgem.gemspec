$:.push File.expand_path("../lib", __FILE__)
require "metanym"

Gem::Specification.new do |s|
  s.name        = "metanym"
  s.version     = Metanym::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Lee Jarvis"]
  s.email       = ["lee@jarvis.co"]
  s.homepage    = "http://github.com/injekt/metanym"
  s.summary     = %q{Search thesaurus.com for synonyms/antonyms}
  s.description = %q{Search thesaurus.com for synonyms/antonyms}

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]

  s.add_runtime_dependency(%q<nokogiri>, [">= 1.4.4"])
  s.add_runtime_dependency(%q<excon>, [">= 0.5.6"])
end
