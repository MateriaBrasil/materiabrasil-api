# frozen_string_literal: true

require 'rails_helper'

describe 'GET /materials', type: :request do
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

  let(:materials) do
    Material.where(published: true)
  end

  before do
    %w[foo bar baz].each do |name|
      Material.create!(
        name: name,
        image_url: 'http://foo.bar',
        description: 'Some description',
        average_price: 'R$ 111,00',
        code: '1234',
        technical_specification_url: 'http://foo',
        supplier: supplier,
        published: true
      )
    end
    Material.create!(
      name: 'quu',
      image_url: 'http://foo.bar',
      description: 'Some description',
      average_price: 'R$ 111,00',
      code: '1234',
      technical_specification_url: 'http://foo',
      supplier: supplier
    )
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
