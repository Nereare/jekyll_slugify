# frozen_string_literal: true

# An extension to Ruby's String class that adds Jekyll-style {#slugify} method.
module JekyllSlugify
  # Sets the current version of the gem
  @version = '0.2.0'

  # Returns the Gem's current version.
  #
  # @return [String] The Gem's current version.
  def self.version
    @version
  end
end
