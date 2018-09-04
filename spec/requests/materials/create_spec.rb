# frozen_string_literal: true

require 'rails_helper'

describe 'POST /materials', type: :request do
  let(:material) { Material.first }
  let(:supplier) { Supplier.first }
  let(:headers) { {} }
  let(:params) do
    {
      name: 'Foo material',
      supplier_id: supplier.id,
      description: 'Some description',
      average_price: 'R$ 111,00',
      code: '1234',
      unit_of_sale: 'foo unit',
      minimum_purchase_quantity: 10,
      maximum_purchase_quantity: 100,
      ncm_code: '03022300',
      sh_code: '0103.91',
      certifications: 'foo certifications',
      certifications_url: 'https://certifications.foo',
      prizes: 'Prizes bar',
      density: 'Some density',
      dimensions: 'Some dimensions'
    }
  end

  before do
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
      reach: 'country',
      user: current_user
    )
  end

  context 'with incorrect params' do
    let(:params) { { foo: 'bar' } }

    before { post '/materials', headers: headers, params: params.to_json }

    it { expect(response).to have_http_status(:bad_request) }
  end

  context 'without current_user' do
    let(:headers) { { 'access-token' => nil } }

    before { post '/materials', headers: headers, params: params.to_json }

    it { expect(response).to have_http_status(:unauthorized) }
  end

  context 'with current_user' do
    context 'with all params' do
      before do
        post '/materials', headers: headers, params: params.to_json
      end

      it { expect(response).to have_http_status(:created) }
      it { expect(response.body).to eq(material.to_json) }
      it { expect(material.supplier).to eq(supplier) }
    end
  end
end
