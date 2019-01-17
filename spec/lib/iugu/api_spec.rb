# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Iugu::API do
  subject(:api) { described_class.new(options) }

  let(:options) { { token: 'foo' } }

  describe '#get' do
    subject(:response) { api.get('/foo') }

    before do
      stub_request(:get, 'https://api.iugu.com/v1/foo').to_return(status: 200)
    end

    it 'returns a successful response' do
      expect(response.success?).to be true
    end
  end

  describe '#post' do
    subject(:response) { api.post('/bar') }

    before do
      stub_request(:post, 'https://api.iugu.com/v1/bar').to_return(status: 200)
    end

    it 'returns a successful response' do
      expect(response.success?).to be true
    end
  end
end
