# frozen_string_literal: true

require 'rails_helper'

describe 'GET /suppliers/:id/addresses', type: :request do
  subject(:body) { JSON.parse(response.body) }

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

  let(:id) { supplier.id }
  let(:params) { nil }

  before do
    %w[Foo Bar Baz].each do |text|
      Address.create!(
        supplier: supplier,
        address_type: 'manufacture',
        street_address: "#{text} street, 123",
        city: "#{text} city",
        state: "#{text} state",
        country: "#{text} country"
      )
    end

    get "/suppliers/#{id}/addresses", params: params
  end

  context 'with supplier not found' do
    let(:id) { supplier.id + 1000 }

    it 'returns not found' do
      expect(response).to have_http_status(:not_found)
    end
  end

  context 'with supplier found' do
    it { expect(response).to have_http_status(:ok) }
    it { is_expected.to eq(JSON.parse(supplier.addresses.to_json)) }
    it { expect(body.length).to eq(3) }
  end

  context 'with bad request' do
    let(:params) { { foo: 'bar' } }

    it { expect(response).to have_http_status(:bad_request) }
  end
end
