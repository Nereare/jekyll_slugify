# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll_slugify/version'

Gem::Specification.new do |spec|
  spec.name          = 'jekyll_slugify'
  spec.version       = JekyllSlugify.version
  spec.authors       = ['Igor Padoim']
  spec.email         = ['igorpadoim@gmail.com']
  spec.license       = 'MIT'

  spec.summary       = 'An extension to Ruby\'s `String` class that adds '\
                       'Jekyll-style `#slugify` method.'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/Nereare/jekyll_slugify'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = spec.homepage + '/blob/master/CHANGELOG.md'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.5.0'

  spec.add_development_dependency 'bundler', '~> 2.0.2'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.8'
  spec.add_development_dependency 'rubocop', '~> 0.82.0'
  spec.add_development_dependency 'simplecov', '~> 0.21.1'
  spec.add_development_dependency 'yard', '~> 0.9.20'

  spec.add_dependency 'i18n', '>= 1.6', '< 2'
end
