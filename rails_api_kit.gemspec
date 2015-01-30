# -*- encoding: utf-8 -*-

$:.unshift File.expand_path("../lib", __FILE__)
require "rails_api_kit/version"

Gem::Specification.new do |gem|
  gem.authors       = ["Lukáš Doležal"]
  gem.email         = ["lukas@feedmepronto.com"]
  gem.description   = %q{Making it easy to build rich and powerful API applications}
  gem.summary       = %q{Set of classes and modules that provides fundamentals for API applications in Ruby on Rails.}
  gem.homepage      = "https://github.com/DocX/rails_api_kit"
  gem.license       = 'MIT'

  gem.files         = Dir['README.md', 'LICENSE', 'lib/**/*']
  gem.test_files    = Dir['test/**/*']

  gem.name          = "rails_api_kit"
  gem.require_paths = ["lib"]
  gem.version       = RailsApiKit::VERSION

  gem.required_ruby_version = ">= 1.9.3"

  gem.add_dependency "activemodel", ">= 4"
  gem.add_dependency "active_model_serializers", ">= 0.9.0.a"
  gem.add_development_dependency "rails", ">= 4"
end