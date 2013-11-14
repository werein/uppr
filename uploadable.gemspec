# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uploadable/version'

Gem::Specification.new do |spec|
  spec.name          = "uploadable"
  spec.version       = Uploadable::VERSION
  spec.authors       = ["Jiri Kolarik"]
  spec.email         = ["jiri.kolarik@imin.cz"]
  spec.description   = %q{Upload images/files and videos easy}
  spec.summary       = %q{Set of carrierwave upload classes}
  spec.homepage      = "http://werein.cz"
  spec.license       = "MIT"

  spec.files         = Dir["{lib}/**/*", "LICENSE.txt", "README.rdoc"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'carrierwave', '~> 0.9'
  spec.add_dependency 'carrierwave_backgrounder', '~> 0.3'
  spec.add_dependency 'mini_magick', '~> 3.6'

  spec.add_development_dependency 'bundler', '~> 1.3'
end