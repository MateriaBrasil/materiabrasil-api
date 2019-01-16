# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST /subscriptions/create', type: :request do
  subject { response }

  context 'when api payment method fails' do
    before do
      stub_payment_request(500)
      post '/subscriptions'
    end

    let(:error_response) do
      {
        id: 'error',
        message: 'Ooops, alguma coisa deu errado com seu pagamento no Iugu. ' \
        'Por favor, tente novamente mais tarde.'
      }.to_json
    end

    it { expect(response).to have_http_status(500) }
    it { expect(response.body).to eq(error_response) }
  end

  context 'when api subscription fails' do
    before do
      stub_payment_request(200)
      stub_subscription_request(status: 500)
      post '/subscriptions'
    end

    let(:error_response) do
      {
        id: 'error',
        message: 'Ooops, alguma coisa deu errado com sua assinatura no Iugu. ' \
      'Por favor, tente novamente mais tarde.'
      }.to_json
    end

    it { expect(response).to have_http_status(500) }
    it { expect(response.body).to eq(error_response) }
  end

  context 'when subscription is created' do
    before do
      stub_payment_request(200)
      stub_subscription_request(status: 200, body: { id: '1' }.to_json)
      post '/subscriptions', params: { subscription: {} }
    end

    it { expect(response).to have_http_status(:created) }
    it { expect(response.body).to eq(subscription.reload.to_json) }

    subject(:subscription) { Subscription.first }

    it { expect(subscription.user).to eq(current_user) }
    it { expect(subscription.state).to eq('pending') }
    it { expect(subscription.payment_method).to be(nil) }
    it { expect(subscription.activated_at).to be(nil) }
  end

  context 'when subscription is created and user as well' do
    before do
      stub_payment_request(200)
      stub_subscription_request(status: 200, body: { id: '1' }.to_json)
      stub_request(:post, 'https://api.iugu.com/v1/customers')
        .with(
          body: '{"email":"foo@bar.com","name":"Foo Bar"}',
          headers: headers
        )
        .to_return(
          status: 200,
          body: { id: '1' }.to_json,
          headers: {}
        )
      current_user.iugu_id = nil  
      post '/subscriptions', params: { subscription: {} }
    end

    it { expect(response).to have_http_status(:created) }
    it { expect(response.body).to eq(subscription.reload.to_json) }

    subject(:subscription) { Subscription.first }

    it { expect(subscription.user).to eq(current_user) }
    it { expect(subscription.state).to eq('pending') }
    it { expect(subscription.payment_method).to be(nil) }
    it { expect(subscription.activated_at).to be(nil) }
  end
end

def stub_payment_request(status)
  stub_request(:post, "#{base_url}/customers/1/payment_methods")
    .with(
      body: {
        description: 'Cartão de crédito',
        set_as_default: true,
        customer_id: current_user.iugu_id,
        token: nil
      }.to_json,
      headers: headers
    ).to_return(status: status)
end

def stub_subscription_request(to_return)
  stub_request(:post, "#{base_url}/subscriptions")
    .with(
      body: {
        credits_based: false,
        plan_identifier: 'monthly',
        customer_id: current_user.iugu_id
      }.to_json,
      headers: headers
    ).to_return(to_return)
end

def base_url
  'https://api.iugu.com/v1'
end

def headers
  {
    'Accept' => 'application/json',
    'Authorization' => /Basic .+/,
    'Content-Type' => 'application/json',
    'Host' => 'api.iugu.com:443'
  }
end
