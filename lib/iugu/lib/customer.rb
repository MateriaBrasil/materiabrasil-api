# frozen_string_literal: true

module Iugu
  class Customer
    attr_reader :api

    def initialize(options)
      @api = options[:api]
    end

    def create(params)
      api.post('/customers', body: params.to_json)
    end
  end
end
