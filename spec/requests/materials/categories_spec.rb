# frozen_string_literal: true

require 'rails_helper'

describe 'GET /materials/:id/comments', type: :request do
  subject(:body) { response.body }

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

  let(:params) { nil }

  let(:root_category) { Category.create!(name: 'Root') }
  let(:child_category) { root_category.children.create!(name: 'Child') }

  let(:grandchild_category) do
    child_category.children.create!(name: 'Grandchild')
  end

  let(:root_association) do
    MaterialCategory.create!(material: material, category: root_category)
  end

  let(:child_association) do
    MaterialCategory.create!(material: material, category: child_category)
  end

  let(:granchild_association) do
    MaterialCategory.create!(material: material, category: grandchild_category)
  end

  let(:expected_body) do
    [
      root_association,
      child_association,
      granchild_association
    ].to_json
  end

  before do
    root_association
    child_association
    granchild_association

    get "/materials/#{material.id}/categories", params: params
  end

  context 'with valid request' do
    it { expect(response).to have_http_status(:ok) }
    it { is_expected.to eq expected_body }
  end

  context 'with bad request' do
    let(:params) { { foo: 'bar' } }

    it { expect(response).to have_http_status(:bad_request) }
  end
end
