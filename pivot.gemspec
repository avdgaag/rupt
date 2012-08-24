# -*- encoding: utf-8 -*-
require File.expand_path('../lib/pivot/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Arjan van der Gaag']
  gem.email         = ['arjan@Kabisa.nl']
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'pivot'
  gem.require_paths = ['lib']
  gem.version       = Pivot::VERSION

  gem.add_development_dependency 'rake', '~> 0.9'
  gem.add_development_dependency 'rspec', '~> 2.10'
  gem.add_dependency 'pivotal-tracker', '~> 0.5.6'
  gem.add_dependency 'commander', '~> 4.1'
end
