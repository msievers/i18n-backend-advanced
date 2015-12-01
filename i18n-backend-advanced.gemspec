# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "i18n-backend-advanced"
  spec.version       = "0.1.3"
  spec.authors       = ["Michael Sievers"]
  spec.summary       = %q{A slightly advanced drop-in replacement for I18n::Backend::Simple with support for references (across files).}
  spec.homepage      = "http://github.com/msievers/i18n-backend-advanced"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "i18n"
end
