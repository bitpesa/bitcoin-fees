# frozen_string_literal: true

require 'rest-client'
require 'json'

module Bitcoin
  module Fees
    class Client
      def initialize(config)
        @config = config
      end

      def recommended
        make_request('/api/v1/fees/recommended')
      end

      def list
        make_request('/api/v1/fees/list')
      end

      private

      def url(path)
        "#{@config.host}#{path}"
      end

      def make_request(path)
        endpoint = url(path)
        response = RestClient.get(endpoint)
        JSON.parse(response)
      end
    end
  end
end
