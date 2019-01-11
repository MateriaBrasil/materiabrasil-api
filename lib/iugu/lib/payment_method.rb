# frozen_string_literal: true

module Iugu
  class PaymentMethod
    attr_reader :api

    def initialize(options)
      @api = options[:api]
    end

    def create(params)
      merged_params = {
        description: 'Cartão de crédito',
        set_as_default: true
      }.merge(params)

      api.post(
        "/customers/#{params[:customer_id]}/payment_methods",
        body: merged_params.to_json
      )
    end
  end
end
