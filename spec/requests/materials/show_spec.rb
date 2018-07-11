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

  context 'with material not found' do
    let(:id) { material.id + 1 }

    before { get "/materials/#{id}", params: params }

    it { expect(response).to have_http_status(:not_found) }
  end

  context 'with material found' do
    before { get "/materials/#{id}", params: params }

    it { expect(response).to have_http_status(:ok) }
    it { expect(response.body).to eq(material.to_json) }
  end

  context 'with reviews' do
    before do
      %w[foo bar baz].each do |text|
        Review.create!(
          reviewable_id: material.id,
          reviewable_type: 'Material',
          text: text,
          rating: 4,
          user: current_user
        )
      end

      get "/materials/#{id}", params: params
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(response.body).to eq(material.to_json) }
  end

  context 'with incorrect request' do
    let(:params) { { foo: 'bar' } }

    before { get "/materials/#{id}", params: params }

    it { expect(response).to have_http_status(:bad_request) }
  end
end
