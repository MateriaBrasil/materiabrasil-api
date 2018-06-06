# frozen_string_literal: true

require 'rails_helper'

describe 'GET /materials', type: :request do
  before do
    %w[foo bar baz].each do |name|
      Material.new(
        name: name,
        image_url: 'http://foo.bar',
        description: 'Some description',
        average_price: 'R$ 111,00',
        code: '1234',
        supplier_name: 'Foo Supplier',
        supplier_email: 'foo@bar.com',
        manufacturing_location: 'Foo City/FO',
        sales_location: 'Bar City/BR',
        technical_specification_url: 'http://foo',
        properties: 'Foo properties',
        usage: 'Bar usage'
      )
    end
  end

  let(:materials) do
    Material.all
  end

  context 'with materials' do
    before do
      get '/materials'
    end

    it 'returns ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders materials' do
      expect(response.body).to eq(materials.to_json)
    end
  end

  context 'with incorrect request' do
    before do
      get '/materials', params: { foo: 'bar' }
    end

    it 'returns bad request' do
      expect(response).to have_http_status(:bad_request)
    end
  end
end
