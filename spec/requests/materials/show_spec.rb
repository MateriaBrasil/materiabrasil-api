# frozen_string_literal: true

require 'rails_helper'

describe 'GET /materials/:id', type: :request do
  let(:material) do
    Material.create!(
      name: 'Foo',
      image_url: 'http://foo.bar',
      description: 'Some description',
      average_price: 'R$ 111,00',
      code: '1234',
      supplier_name: 'Foo Supplier',
      supplier_contact: 'foo@bar.com',
      manufacturing_location: 'Foo City/FO',
      sales_location: 'Bar City/BR',
      technical_specification_url: 'http://foo',
      properties: 'Foo properties',
      usage: 'Bar usage'
    )
  end

  let(:id) { material.id }
  let(:params) { nil }

  before do
    get "/materials/#{id}", params: params
  end

  context 'with material not found' do
    let(:id) { material.id + 1 }

    it 'returns not found' do
      expect(response).to have_http_status(:not_found)
    end
  end

  context 'with material found' do
    it 'returns ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns the material' do
      expect(response.body).to eq(material.to_json)
    end
  end

  context 'with incorrect request' do
    let(:params) { { foo: 'bar' } }

    it 'returns bad request' do
      expect(response).to have_http_status(:bad_request)
    end
  end
end
