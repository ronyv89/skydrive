# -*- encoding: utf-8 -*-
require File.expand_path('../lib/skydrive/version', __FILE__)
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.authors       = ["Rony Varghese"]
  gem.email         = ["rony@mobme.in"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "skydrive"
  gem.require_paths = ["lib"]
  gem.version       = Skydrive::VERSION
  gem.add_dependency 'httparty', '>= 0.10.2'
  gem.add_dependency 'httmultiparty'
  gem.add_dependency 'oauth2'
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rb-inotify"
  gem.add_development_dependency "guard"
  gem.add_development_dependency "guard-rspec"
  gem.add_development_dependency "simplecov"
  gem.add_development_dependency "metric_abc"
  gem.add_development_dependency "yard"
  gem.add_development_dependency "ci_reporter"
  gem.add_development_dependency "simplecov-rcov"
  gem.add_development_dependency "rdiscount"
  gem.add_development_dependency "webmock"
  gem.add_development_dependency "rspec_multi_matchers"
end
