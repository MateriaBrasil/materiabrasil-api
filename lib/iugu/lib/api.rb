# frozen_string_literal: true

module Iugu
  class API
    attr_reader :token

    def initialize(options)
      @token = options[:token]
    end

    def get(path, options = {})
      request(:get, path, options)
    end

    def post(path, options = {})
      request(:post, path, options)
    end

    private

    def request(method, path, options = {})
      url = "https://api.iugu.com/v1#{path}"
      merged_options = {
        user: @token,
        headers: {
          'Content-Type' => 'application/json',
          'Accept' => 'application/json'
        }
      }.deep_merge(options)

      response = Excon.send(method, url, merged_options)

      Response.new(response)
    end
  end
end
