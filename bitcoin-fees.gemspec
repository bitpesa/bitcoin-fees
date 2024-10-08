
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bitcoin/fees/version'

Gem::Specification.new do |spec|
  spec.name          = 'bitcoin-fees'
  spec.version       = Bitcoin::Fees::VERSION
  spec.authors       = ['Callum Dryden']
  spec.email         = ['callum@bitpesa.co']

  spec.summary       = 'This gem provides a simple wrapper for the https://bitcoinfees.earn.com api'
  spec.homepage      = 'https://bitpesa.co'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'webmock', ['>= 0']

  spec.add_runtime_dependency 'rest-client', '~> 2.0'
  spec.add_runtime_dependency 'json', '~> 2'
end
