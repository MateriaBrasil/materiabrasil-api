# frozen_string_literal: true

require 'rails_helper'

describe 'GET /materials/:id', type: :request do
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
      usage: 'Bar usage',
      supplier: supplier
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
    let(:other_user) do
      User.create!(
        email: 'bar@foo.com',
        first_name: 'Foo',
        last_name: 'Bar',
        password: 'foobarfoo'
      )
    end

    before do
      Review.create!(
        reviewable_id: material.id,
        reviewable_type: 'Material',
        text: 'foo bar',
        rating: 4,
        user: current_user
      )
      Review.create!(
        reviewable_id: material.id,
        reviewable_type: 'Material',
        text: 'bar foo',
        rating: 3,
        user: other_user
      )
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
