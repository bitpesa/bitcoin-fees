# frozen_string_literal: true

require_relative 'configuration'
require_relative 'client'

module Bitcoin
  module Fees
    def self.client
      @client
    end

    def self.configure(&block)
      @client = Client.new(Configuration.new(&block))
    end
  end
end
