# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uppr/version'

Gem::Specification.new do |spec|
  spec.name          = "uppr"
  spec.version       = Uppr::VERSION
  spec.authors       = ["Jiri Kolarik"]
  spec.email         = ["jiri.kolarik@imin.cz"]
  spec.description   = %q{Easy images, videos and files uploader}
  spec.summary       = %q{CarrierWave classes for uploading images, videos and files with background support}
  spec.homepage      = "http://werein.cz"
  spec.license       = "MIT"

  spec.files         = Dir["{lib}/**/*", "License.txt", "Readme.md"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'carrierwave', '~> 0.10'
  spec.add_dependency 'carrierwave_backgrounder', '~> 0.3'
  spec.add_dependency 'carrierwave-ffmpeg', '~> 1.0'
  spec.add_dependency 'mini_magick', '~> 3.7'

  spec.add_development_dependency "bundler", "~> 1.5"
end