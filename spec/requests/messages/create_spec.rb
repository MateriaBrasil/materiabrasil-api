# frozen_string_literal: true

require 'rails_helper'

describe 'POST /reviews', type: :request do
  let(:headers) { {} }

  let(:params) do
    {
      to_id: supplier.id,
      to_type: 'Supplier',
      text: 'foo bar'
    }
  end

  let(:supplier) do
    Supplier.create!(
      user: current_user,
      name: 'Foo Bar',
      description: 'Foo description',
      website: 'http://foo',
      email: 'foo@company.com',
      cnpj: '123456789',
      company_name: 'Foo Inc',
      municipal_subscription: 'does not apply',
      state_subscription: '987654321',
      phone: '5551987654321',
      company_revenue: '100000000',
      number_of_employees: 1000,
      reach: 'country',
      image_url: 'http://foo-image'
    )
  end

  context 'with incorrect params' do
    let(:params) { { message: { foo: 'bar' } } }

    before { post '/messages', headers: headers, params: params.to_json }

    it { expect(response).to have_http_status(:bad_request) }
  end

  context 'without current_user' do
    let(:headers) { { 'access-token' => nil } }

    before { post '/messages', headers: headers, params: params.to_json }

    it { expect(response).to have_http_status(:unauthorized) }
  end

  context 'with current_user' do
    let(:message) { Message.first }

    before { post '/messages', headers: headers, params: params.to_json }

    it { expect(response).to have_http_status(:created) }
    it { expect(response.body).to eq(message.to_json) }
    it { expect(message.from).to eq(current_user) }
    it { expect(message.to).to eq(supplier) }
  end
end
