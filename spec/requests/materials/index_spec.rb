# frozen_string_literal: true

require 'rails_helper'

describe 'GET /materials', type: :request do
  before do
    %w[foo bar baz].each do |name|
      Material.create!(
        name: name,
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
  end

  let(:materials) do
    Material.all
  end

  context 'with materials' do
    before { get '/materials' }

    it { expect(response).to have_http_status(:ok) }
    it { expect(response.body).to eq(materials.reverse.to_json) }
    it { expect(JSON.parse(response.body).length).to be(3) }
  end

  context 'with incorrect request' do
    before { get '/materials', params: { foo: 'bar' } }

    it { expect(response).to have_http_status(:bad_request) }
  end
end
