# frozen_string_literal: true

module Iugu
  class Charge
    attr_reader :api

    def initialize(options)
      @api = options[:api]
    end

    def create(params)
      api.post('/charge', body: params.to_json)
    end
  end
end
