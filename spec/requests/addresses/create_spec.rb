# frozen_string_literal: true

require 'rails_helper'

describe 'POST /addresses', type: :request do
  let(:address) { Address.first }
  let(:headers) { {} }

  let(:params) do
    {
      supplier_id: supplier.id,
      address_type: 'manufacture',
      street_address: 'Foo street, 123',
      city: 'Foo city',
      state: 'Foo state',
      country: 'Foo country',
      zip_code: nil,
      phone_number: nil
    }
  end

  let(:supplier) do
    Supplier.create!(
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
      image_url: 'http://foo-image',
      user: current_user
    )
  end

  before do
    post '/addresses', headers: headers, params: params.to_json
  end

  context 'with incorrect params' do
    let(:params) { { foo: 'bar' } }

    it { expect(response).to have_http_status(:bad_request) }
  end

  context 'without current_user' do
    let(:headers) { { 'access-token' => nil } }

    it { expect(response).to have_http_status(:unauthorized) }
  end

  context 'with current_user' do
    it { expect(response).to have_http_status(:created) }
    it { expect(response.body).to eq(address.to_json) }
    it { expect(address.supplier).to eq(supplier) }
  end
end
