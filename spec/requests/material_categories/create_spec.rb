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
      type_of_company: 1,
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

  let(:parent_category) do
    Category.create!(
      name: 'Some Parent Category',
      multiple_choice: false
    )
  end

  let(:category) do
    parent_category.children.create!(
      name: 'Some Category'
    )
  end

  let(:child_category) do
    category.children.create!(
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

  context 'with current_admin' do
    include_context 'with current_admin'

    before do
      post '/material_categories', headers: headers, params: params.to_json
    end

    it { expect(response).to have_http_status(:created) }
    it { expect(response.body).to eq(MaterialCategory.last.to_json) }
    it { expect(response.headers['uid']).to eq(current_admin.email) }
  end

  context 'with another user' do
    let(:another_user) do
      User.create!(
        email: 'another@bar.com',
        first_name: 'another',
        last_name: 'Bar',
        password: 'anotherbaranother',
        iugu_id: '1',
        admin: false
      )
    end

    let(:headers) { another_user.create_new_auth_token }

    before do
      post '/material_categories', headers: headers, params: params.to_json
    end

    it { expect(response).to have_http_status(:forbidden) }
  end

  context 'without current_user' do
    let(:headers) { { 'access-token' => nil } }

    before do
      post '/material_categories', headers: headers, params: params.to_json
    end

    it { expect(response).to have_http_status(:unauthorized) }
  end
end
