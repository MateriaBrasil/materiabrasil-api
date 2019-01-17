# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Iugu::API::Response do
  subject(:response) { described_class.new(excon_response) }

  let(:body) { '{"foo": "bar"}' }
  let(:status) { 200 }

  let(:excon_response) do
    Excon::Response.new(
      body: body,
      headers: { foo: 'bar' },
      status: status
    )
  end

  describe '#json' do
    context 'with valid JSON' do
      it 'returns the parsed json' do
        expect(response.json).to eq('foo' => 'bar')
      end
    end

    context 'with empty string' do
      let(:body) { '' }

      it 'returns nil' do
        expect(response.json).to be_nil
      end
    end
  end

  describe '#success' do
    context 'with success status' do
      it 'returns false' do
        expect(response.success?).to be true
      end
    end

    context 'with error status' do
      let(:status) { 500 }

      it 'returns false' do
        expect(response.success?).to be false
      end
    end
  end
end
