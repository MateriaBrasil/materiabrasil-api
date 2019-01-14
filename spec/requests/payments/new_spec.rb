# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /payments/new', type: :request do
  subject { response }

  context 'with logged in user' do
    context 'with successful api request' do
      before do
        headers = {
          'Accept' => 'application/json',
          'Authorization' => /Basic .+/,
          'Content-Type' => 'application/json',
          'Host' => 'api.iugu.com:443'
        }
        stub_request(:post, 'https://api.iugu.com/v1/customers')
          .with(
            body: '{"email":"foo@bar.com","name":"Foo Bar"}',
            headers: headers
          )
          .to_return(
            status: 200,
            body: { id: 'bar' }.to_json,
            headers: {}
          )
        get '/payments/new'
      end

      it { is_expected.to have_http_status(:ok) }
    end

    context 'with failed api request' do
      before do
        headers = {
          'Accept' => 'application/json',
          'Authorization' => /Basic .+/,
          'Content-Type' => 'application/json',
          'Host' => 'api.iugu.com:443'
        }
        stub_request(:post, 'https://api.iugu.com/v1/customers')
          .with(
            body: '{"email":"foo@bar.com","name":"Foo Bar"}',
            headers: headers
          )
          .to_return(
            status: 500,
            body: {}.to_json,
            headers: {}
          )
        get '/payments/new'
      end

      let(:error_response) do
        {
          id: 'error',
          message: 'Ooops, alguma coisa deu errado com seu cadastro no Iugu. ' \
          'Por favor, tente novamente mais tarde.'
        }.to_json
      end

      it { expect(response).to have_http_status(:error) }
      it { expect(response.body).to eq(error_response) }
    end
  end
end
