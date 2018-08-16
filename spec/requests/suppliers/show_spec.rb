# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /suppliers/:id', type: :request do
  let(:headers) { {} }
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

  context 'without current_user' do
    let(:headers) { { 'access-token' => nil } }

    before { get "/suppliers/#{supplier.id}", headers: headers }

    it { expect(response).to have_http_status(:ok) }
    it { expect(response.body).to eq(supplier.to_json) }
  end

  context 'with current_user' do
    context 'with supplier not found' do
      before { get "/suppliers/#{supplier.id + 100}", headers: headers }

      it { expect(response).to have_http_status(:not_found) }
    end

    context 'with supplier found' do
      before { get "/suppliers/#{supplier.id}", headers: headers }

      it { expect(response).to have_http_status(:ok) }
      it { expect(response.body).to eq(supplier.to_json) }
    end
  end

  context 'when supplier has materials' do
    before do
      %w[foo bar baz].each do |name|
        Material.create!(
          name: name,
          image_url: 'http://foo.bar',
          description: 'Some description',
          average_price: 'R$ 111,00',
          code: '1234',
          manufacturing_location: 'Foo City/FO',
          sales_location: 'Bar City/BR',
          technical_specification_url: 'http://foo',
          properties: 'Foo properties',
          usage: 'Bar usage',
          supplier: supplier
        )
      end

      get "/suppliers/#{supplier.id}"
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(response.body).to eq(supplier.reload.to_json) }
    it { expect(JSON.parse(response.body)['materials'].length).to be(3) }
  end

  context 'with incorrect request' do
    before { get "/suppliers/#{supplier.id}", params: { foo: 'bar' } }

    it { expect(response).to have_http_status(:bad_request) }
  end
end
