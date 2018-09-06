# frozen_string_literal: true

require 'rails_helper'

describe 'POST /material_categories', type: :request do
  let(:headers) { {} }

  let(:params) do
    {
      material_id: material.id,
      category_id: category.id
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

  let(:category) do
    Category.create!(
      name: 'Some Category'
    )
  end

  context 'with current_user' do
    before do
      post '/material_categories', headers: headers, params: params.to_json
    end

    it { expect(response).to have_http_status(:created) }
    it { expect(response.body).to eq(MaterialCategory.last.to_json) }
  end

  context 'with incorrect params' do
    let(:params) { { foo: 'bar' } }

    before do
      post '/material_categories', headers: headers, params: params.to_json
    end

    it { expect(response).to have_http_status(:bad_request) }
  end

  context 'without current_user' do
    let(:headers) { { 'access-token' => nil } }

    before do
      post '/material_categories', headers: headers, params: params.to_json
    end

    it { expect(response).to have_http_status(:unauthorized) }
  end
end