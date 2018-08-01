# frozen_string_literal: true

require 'rails_helper'

describe 'POST /suppliers', type: :request do
  let(:supplier) { Supplier.first }
  let(:user) { User.first }
  let(:headers) { {} }
  let(:params) do
    {
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
      reach: 'country'
    }
  end

  context 'with incorrect params' do
    let(:params) { { foo: 'bar' } }

    before { post '/suppliers', headers: headers, params: params.to_json }

    it { expect(response).to have_http_status(:bad_request) }
  end

  context 'without current_user' do
    let(:headers) { { 'access-token' => nil } }

    before { post '/suppliers', headers: headers, params: params.to_json }

    it { expect(response).to have_http_status(:unauthorized) }
  end

  context 'with current_user' do
    before do
      post '/suppliers', headers: headers, params: params.to_json
    end

    it { expect(response).to have_http_status(:created) }
    it { expect(response.body).to eq(supplier.to_json) }
    it { expect(supplier.user).to eq(current_user) }
  end
end
