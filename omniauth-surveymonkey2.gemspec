require File.expand_path('../lib/omniauth/surveymonkey2/version', __FILE__)

Gem::Specification.new do |gem|
  gem.add_dependency 'omniauth', '~> 1.0'

  gem.authors = ["Kaushik SV", "Chris Beck"]
  gem.email = ["speak2kaushik@gmail.com", "chris.beck@me.com"]

  gem.description = %q{Survemonkey OAuth2 strategy for OmniAuth 1.0}
  gem.summary = %q{Survemonkey OAuth2 strategy for OmniAuth 1.0.}


  gem.files = `git ls-files`.split("\n")
  gem.test_files = `git ls-files spec/*`.split("\n")
  gem.name = "omniauth-surveymonkey2"
  gem.require_paths = ["lib"]

  gem.version = OmniAuth::Surveymonkey2::VERSION
  gem.homepage = "https://github.com/cbeck/omniauth-surveymonkey"

  gem.add_runtime_dependency 'omniauth-oauth2'

  gem.add_development_dependency 'rspec', '~> 1.3.1'
  gem.add_development_dependency 'rake'
end