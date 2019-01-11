# frozen_string_literal: true

module Iugu
  class Subscription
    attr_reader :api

    def initialize(options)
      @api = options[:api]
    end

    def create(params)
      merged_params = { credits_based: false }.merge(params)
      api.post(
        '/subscriptions',
        body: merged_params.to_json
      )
    end
  end
end
