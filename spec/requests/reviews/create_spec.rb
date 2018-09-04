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

  let(:material) do
    Material.create!(
      name: 'Foo',
      image_url: 'http://foo.bar',
      description: 'Some description',
      average_price: 'R$ 111,00',
      code: '1234',
      technical_specification_url: 'http://foo',
      supplier: supplier
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

  context 'when current_user already wrote a review' do
    before do
      Review.create!(
        reviewable_id: material.id,
        reviewable_type: 'Material',
        text: 'foo bar',
        rating: 4,
        user: current_user
      )

      post '/reviews', headers: headers, params: params.to_json
    end

    it { expect(response).to have_http_status(:unprocessable_entity) }
  end
end
