# frozen_string_literal: true

require 'jekyll_slugify'

# Extends the native String class to have a {#slugify} method.
class String
  # Slugifies a string.
  #
  # @param mode [String or nil] Either one of _raw_, _default_, _pretty_,
  #   _ascii_, _latin_ or nil.
  # @param cased [Boolean] If the slugify method must respect original case.
  # @return [String] The slugified string.
  def slugify(mode = 'latin', cased = nil)
    JekyllSlugify::Slugify.new(self, mode: mode, cased: cased).to_s
  end
end
