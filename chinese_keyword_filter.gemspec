# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chinese_keyword_filter/version'

Gem::Specification.new do |spec|
  spec.name          = "chinese_keyword_filter"
  spec.version       = ChineseKeywordFilter::VERSION
  spec.authors       = ["kang cao"]
  spec.email         = ["cooker_bj@hotmail.com"]
  spec.description   = %q{the is a validation for match regular chinese government}
  spec.summary       = %q{it has a validator}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activerecord"
  spec.add_development_dependency "activerecord"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
