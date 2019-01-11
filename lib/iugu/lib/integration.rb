# frozen_string_literal: true

module Iugu
  class Integration
    attr_reader :token, :customer, :api, :payment_method, :subscription, :charge

    def initialize(options)
      @token = options[:token]
      @api = API.new(options)
      @customer = Customer.new(options.merge(api: @api))
      @payment_method = PaymentMethod.new(options.merge(api: @api))
      @subscription = Subscription.new(options.merge(api: @api))
      @charge = Charge.new(options.merge(api: @api))
    end
  end
end
