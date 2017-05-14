# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slt_xcodeproj_helper/version'

Gem::Specification.new do |spec|
  spec.name          = "slt_xcodeproj_helper"
  spec.version       = SltXcodeprojHelper::VERSION
  spec.authors       = ["LiuShulong"]
  spec.email         = ["bigfish_liu@126.com"]

  spec.summary       = %q{sltset xcode settings}
  spec.description   = %q{a commandline to sltset xcode project settings}
  spec.homepage      = "https://github.com/LiuShulong/slt_xcodeproj_helper.git"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = "sltset"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "xcodeproj",'~> 0'
end
