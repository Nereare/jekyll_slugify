# jekyll_slugify

[![Gem](https://img.shields.io/gem/v/jekyll_slugify)](https://rubygems.org/gems/jekyll_slugify)
[![License](https://img.shields.io/github/license/Nereare/jekyll_slugify.svg)](https://github.com/Nereare/jekyll_slugify)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v1.4%20adopted-ff69b4.svg)](CODE-OF-CONDUCT.md)

[![Travis (.org)](https://img.shields.io/travis/Nereare/jekyll_slugify)]()
[![Code Climate maintainability](https://img.shields.io/codeclimate/maintainability/Nereare/jekyll_slugify)](https://codeclimate.com/github/Nereare/jekyll_slugify)
[![Code Climate coverage](https://img.shields.io/codeclimate/coverage/Nereare/jekyll_slugify)](https://codeclimate.com/github/Nereare/jekyll_slugify)
[![Libraries.io dependency status for GitHub repo](https://img.shields.io/librariesio/github/Nereare/jekyll_slugify)](https://libraries.io/github/Nereare/jekyll_slugify)

An extension to Ruby's `String` class that adds Jekyll-style `#slugify` method.

## Installing

1. Add `jekyll_slugify` to dependencies:
    1. Gemfile: `gem 'jekyll_slugify', '~> VERSION'`; or
    2. gemspec file: `spec.add_dependency 'jekyll_slugify', '~> VERSION'`;
2. Run `bundle install` to fetch the gem from [RubyGems](https://rubygems.org/gems/jekyll_slugify);
3. Require the gem on your code: `require 'jekyll_slugify'`
4. Apply the `#slugify` method on a string:
```ruby
@foo = 'Hello Worlds!'
puts @foo.slugify
    => hello-worlds
```

Do note, however, that the `slugify` method will not work on ideograms - an ideogram-only word will actually raise an error!

```ruby
puts 'Ærøskøbing'.slugify # Works
    => aeroskobing

puts '指事字'.slugify # Raises a Runtime error
    => Empty `slug` generated for given String (RuntimeError)
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :tada:

Please, also read our [Contributing Guidelines](CONTRIBUTING.md).

### Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CODE-OF-CONDUCT.md). By participating in this project you agree to abide by its terms.

## History & Versioning

See the [Change Log](CHANGELOG.md) for further history.

This project uses [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/Nereare/jekyll_slugify/tags).

## Legal Stuff

[![MIT License](https://i.imgur.com/Ze3dFob.png)](LICENSE.md)

This project is available under the [MIT License](https://opensource.org/licenses/MIT).

The code on this project is adapted from Jekyll's `Utils#slugify` method, available under the same [MIT License](https://opensource.org/licenses/MIT).
