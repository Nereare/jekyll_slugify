# frozen_string_literal: true

require 'jekyll_slugify/version'
require 'i18n'
require 'string'

# An extension to Ruby's String class that adds Jekyll-style `slugify` method.
module JekyllSlugify
  # Sets the method to be applied on {String#slugify}.
  class Slugify
    # Constants for use in {#initialize}'s mode parameter.
    SLUGIFY_MODES = %w[raw default pretty ascii latin].freeze
    # The _raw_ mode of slugifying a string.
    SLUGIFY_RAW_REGEXP = Regexp.new('\\s+').freeze
    # The _default_ mode of slugifying a string.
    SLUGIFY_DEFAULT_REGEXP = Regexp.new('[^[:alnum:]]+').freeze
    # The _pretty_ mode of slugifying a string.
    SLUGIFY_PRETTY_REGEXP = Regexp.new("[^[:alnum:]._~!$&'()+,;=@]+").freeze
    # The _ascii_ mode of slugifying a string.
    SLUGIFY_ASCII_REGEXP = Regexp.new('[^[A-Za-z0-9]]+').freeze

    # The slugified string
    attr_reader :slug

    # Slugify a filename or title.
    #
    # string - the filename or title to slugify
    # mode - how string is slugified
    # cased - whether to replace all uppercase letters with their
    # lowercase counterparts
    #
    # When mode is "none", return the given string.
    #
    # When mode is "raw", return the given string,
    # with every sequence of spaces characters replaced with a hyphen.
    #
    # When mode is "default" or nil, non-alphabetic characters are
    # replaced with a hyphen too.
    #
    # When mode is "pretty", some non-alphabetic characters (._~!$&'()+,;=@)
    # are not replaced with hyphen.
    #
    # When mode is "ascii", some everything else except ASCII characters
    # a-z (lowercase), A-Z (uppercase) and 0-9 (numbers) are not replaced with
    # hyphen.
    #
    # When mode is "latin", the input string is first preprocessed so that
    # any letters with accents are replaced with the plain letter. Afterwards,
    # it follows the "default" mode of operation.
    #
    # If cased is true, all uppercase letters in the result string are
    # replaced with their lowercase counterparts.
    #
    # Examples:
    #   slugify("The _config.yml file")
    #   # => "the-config-yml-file"
    #
    #   slugify("The _config.yml file", "pretty")
    #   # => "the-_config.yml-file"
    #
    #   slugify("The _config.yml file", "pretty", true)
    #   # => "The-_config.yml file"
    #
    #   slugify("The _config.yml file", "ascii")
    #   # => "the-config-yml-file"
    #
    #   slugify("The _config.yml file", "latin")
    #   # => "the-config-yml-file"
    #
    # Returns the slugified string.
    def initialize(string, mode: nil, cased: false)
      string, mode = check_params(string, mode, cased)

      string = deal_with_locales(mode, string)
      @slug = replace_character_sequence_with_hyphen(string, mode: mode)
      @slug = process_slug(@slug, cased)
      slug_empty?(@slug)
    end

    # Returns the slugified string.
    #
    # @return [String] The slugified string.
    def to_s
      @slug
    end

    private

    def check_params(string, mode, cased)
      mode ||= 'default'
      msg = 'String must be a non-nil String'
      raise ArgumentError, msg if string.nil?
      raise ArgumentError, msg unless string.is_a? String

      mode = 'latin' unless SLUGIFY_MODES.include?(mode)
      string = cased ? string : string.downcase

      [string, mode]
    end

    def process_slug(slug, cased)
      # Remove leading/trailing hyphen
      slug.gsub!(/^\-|\-$/i, '')
      slug.downcase! unless cased

      slug
    end

    def slug_empty?(slug)
      msg = 'Empty `slug` generated for given String'
      raise msg if slug.empty?
    end

    def deal_with_locales(mode, string)
      # Drop accent marks from latin characters. Everything else turns to ?
      if mode == 'latin'
        if I18n.config.available_locales.empty?
          I18n.config.available_locales = :en
        end
        string = I18n.transliterate(string)
      end
      string
    end

    def replace_character_sequence_with_hyphen(string, mode: 'default')
      replaceable_char = replace_character(mode)
      string.gsub(replaceable_char, '-')
    end

    def replace_character(mode)
      case mode
      when 'raw'
        SLUGIFY_RAW_REGEXP
      when 'pretty'
        SLUGIFY_PRETTY_REGEXP
      when 'ascii'
        SLUGIFY_ASCII_REGEXP
      else
        SLUGIFY_DEFAULT_REGEXP
      end
    end
  end
end
