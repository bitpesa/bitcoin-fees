# frozen_string_literal: true

module Bitcoin
  module Fees
    class Configuration
      DEFAULT_HOST = 'https://bitcoinfees.earn.com'.freeze
      attr_accessor :host

      def initialize
        yield self if block_given?
        self.host ||= DEFAULT_HOST
      end
    end
  end
end
