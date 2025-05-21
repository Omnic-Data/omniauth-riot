# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-riot/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-riot"
  spec.version       = OmniAuth::Riot::VERSION
  spec.authors       = ["OmnicAI"]
  spec.email         = ["dev@omnic.ai"]
  spec.summary       = %q{Omniauth Strategy for Riot}
  spec.description   = %q{Omniauth Strategy for Riot OAuth Login. For more info visit https://developer.riotgames.com}
  spec.homepage      = "https://developer.riotgames.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'omniauth-oauth2'

  spec.add_development_dependency "bundler", "~> 2.5.23"
  spec.add_development_dependency "rake"
end
