# frozen_string_literal: true

require 'rails_helper'

describe 'GET /search', type: :request do
  let(:params) { { term: term } }

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

  let!(:material) do
    Material.create!(
      name: 'quu',
      image_url: 'http://foo.bar',
      description: 'Find me',
      average_price: 'R$ 111,00',
      code: '1234',
      technical_specification_url: 'http://foo',
      supplier: supplier
    )
  end

  let!(:material_with_accent) do
    Material.create!(
      name: 'fóo bâr',
      image_url: 'http://foo.bar',
      description: 'Find me',
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

  before do
    %w[foo bar baz].each do |name|
      Material.create!(
        name: name,
        image_url: 'http://foo.bar',
        description: 'Not found',
        average_price: 'R$ 111,00',
        code: '1234',
        technical_specification_url: 'http://foo',
        supplier: supplier
      )
    end
  end

  describe 'with content found' do
    context 'with material without accent' do
      let(:term) { 'Find me' }

      before { get '/search', params: params }

      it { expect(response).to have_http_status(:ok) }
      it { expect(response.body).to eq([material].to_json) }
    end

    context 'with material with accent' do
      let(:term) { 'foo bar' }

      before { get '/search', params: params }

      it { expect(response).to have_http_status(:ok) }
      it { expect(response.body).to eq([material_with_accent].to_json) }
    end

  end

  context 'without content found' do
    let(:term) { 'Something else' }

    before { get '/search', params: params }

    it { expect(response).to have_http_status(:not_found) }
  end

  context 'with categories' do
    let(:term) { 'Find Me' }

    before do
      MaterialCategory.create!(material: material, category: category)
      Material.create!(
        name: 'Foo',
        image_url: 'http://foo.bar',
        description: 'Find Me',
        average_price: 'R$ 111,00',
        code: '1234',
        technical_specification_url: 'http://foo',
        supplier: supplier
      )
      get '/search', params: { term: term, categories: [category.id] }
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(response.body).to eq([material].to_json) }
  end

  context 'with wrong params' do
    before { get '/search', params: { foo: 'bar' } }

    it { expect(response).to have_http_status(:bad_request) }
  end
end
