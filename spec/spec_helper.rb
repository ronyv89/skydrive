require "simplecov"
require "simplecov-rcov"

require 'webmock/rspec'
require 'rspec_multi_matchers'

SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
SimpleCov.start do
  add_filter "vendor"
  add_filter "spec"
end if ENV["COVERAGE"]
require 'skydrive'