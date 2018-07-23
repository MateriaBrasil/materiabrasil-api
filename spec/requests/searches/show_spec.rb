# frozen_string_literal: true

require 'rails_helper'

describe 'GET /search', type: :request do
  let(:params) { { term: term } }

  let!(:material) do
    Material.create!(
      name: 'quu',
      image_url: 'http://foo.bar',
      description: 'Find me',
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

  before do
    %w[foo bar baz].each do |name|
      Material.create!(
        name: name,
        image_url: 'http://foo.bar',
        description: 'Not found',
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

  context 'with content found' do
    let(:term) { 'Find me' }

    before { get '/search', params: params }

    it { expect(response).to have_http_status(:ok) }
    it { expect(response.body).to eq([material].to_json) }
  end

  context 'without content found' do
    let(:term) { 'Something else' }

    before { get '/search', params: params }

    it { expect(response).to have_http_status(:not_found) }
  end

  context 'with wrong params' do
    before { get '/search', params: { foo: 'bar' } }

    it { expect(response).to have_http_status(:bad_request) }
  end
end
