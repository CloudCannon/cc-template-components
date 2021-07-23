# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "cc-template-components"
  spec.version       = "0.1.0"
  spec.authors       = ["Jordan Trbuhovic"]
  spec.email         = ["jordan@cloudcannon.com"]

  spec.summary       = "A library of components for CloudCannon's templates"
  spec.homepage      = "https://cloudcannon.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|components|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.2"
end
