# frozen_string_literal: true

module Iugu
  class API
    class Response
      attr_reader :status, :json, :headers

      def initialize(response)
        @status = response.status
        @headers = response.headers
        @json = JSON.parse(response.body) if response.body.present?
      end

      def success?
        status >= 200 && status < 400
      end
    end
  end
end
