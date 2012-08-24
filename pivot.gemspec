# -*- encoding: utf-8 -*-
require File.expand_path('../lib/pivot/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Arjan van der Gaag']
  gem.email         = ['arjan@Kabisa.nl']
  gem.description   = %q{A command line client for Pivotal Tracker}
  gem.summary       = <<-EOS
Pivot is command line interface for Pivotal Tracker projects, allowing you to
browse through items, tasks and comments; progress or edit items; and integrate
with your daily Git workflow.
EOS
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
