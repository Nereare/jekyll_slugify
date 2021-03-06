# [jekyll_slugify](https://github.com/Nereare/jekyll_slugify) Change Log

This is the change log to jekyll_slugify. For further info on this project, see the [ReadMe file](README.md).

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) and this project adheres to [Semantic Versioning](http://semver.org/).

Principles of a change log, excerpted from [Keep a Changelog](http://keepachangelog.com/):

* It’s made for humans, not machines, so legibility is crucial.
* Easy to link to any section (hence Markdown over plain text).
* One sub-section per version.
* List releases in reverse-chronological order (newest on top).
* Write all dates in `YYYY-MM-DD` format. (Example: `2012-06-02` for `June 2nd, 2012`.) It’s international, [sensible](http://xkcd.com/1179/), and language-independent.
* Explicitly mention whether the project follows [Semantic Versioning](http://semver.org/).
* Each version should:
  * `List` its release date in the above format.
  * `Group` changes to describe their impact on the project, as follows:
    * `Added` for new features.
    * `Changed` for changes in existing functionality.
    * `Deprecated` for once-stable features removed in upcoming releases.
    * `Removed` for deprecated features removed in this release.
    * `Fixed` for any bug fixes.
    * `Security` to invite users to upgrade in case of vulnerabilities.

## [Unreleased]

## [0.4.3] - `2019-10-02`

### Changed
* Bump `i18n` version and update its version requirement.

## [0.4.2] - `2019-09-07`

### Added
* Code of Conduct from [Contributor Covenant v1.4.1](https://www.contributor-covenant.org/).
* [License](LICENSE.md).
* Git metafiles (`.gitignore` and `.gitattributes`).
* GitHub templates:
  - Issues;
  - Feature request;
  - User question;
  - Pull request.
* ReadMe file.
* Changelog file.
* Requires [I18n](https://rubygems.org/gems/i18n) gem.
* Adds main module (`JekyllSlugify`).
* Adds `#slugify` method to the native `String` class.

[Unreleased]: https://github.com/Nereare/Grimoire/compare/v0.4.3...HEAD
[0.4.3]: https://github.com/Nereare/Grimoire/compare/v0.4.2...v0.4.3
[0.4.2]: https://github.com/Nereare/Grimoire/releases/tag/v0.4.2
