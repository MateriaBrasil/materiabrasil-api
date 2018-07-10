# frozen_string_literal: true

require 'rails_helper'

describe 'POST /reviews', type: :request do
  let(:review) { Review.first }
  let(:headers) { {} }
  let(:params) do
    {
      text: 'foo bar',
      rating: 4,
      reviewable_id: material.id,
      reviewable_type: 'Material'
    }
  end

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

  context 'with incorrect params' do
    let(:params) { { foo: 'bar' } }

    before { post '/reviews', headers: headers, params: params.to_json }

    it { expect(response).to have_http_status(:bad_request) }
  end

  context 'without current_user' do
    let(:headers) { { 'access-token' => nil } }

    before { post '/reviews', headers: headers, params: params.to_json }

    it { expect(response).to have_http_status(:unauthorized) }
  end

  context 'with current_user' do
    before { post '/reviews', headers: headers, params: params.to_json }

    it { expect(response).to have_http_status(:created) }
    it { expect(response.body).to eq(review.to_json) }
    it { expect(review.user).to eq(current_user) }
    it { expect(review.reviewable).to eq(material) }
  end
end
