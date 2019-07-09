# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PUT /material/:id', type: :request do
  let(:headers) { {} }
  let(:params) do
    {
      name: 'Foo material',
      description: 'Some description',
      average_price: 'R$ 111,00',
      code: '1234',
      image_url: 'http://foo-image',
      cover_image_url: 'http://foo-cover-image',
      highlight_image_url: 'http://foo-highlight-image',
      list_image_url: 'http://foo-list-image',
      technical_specification_url: 'http://foo-url',
      unit_of_sale: 'foo unit',
      minimum_purchase_quantity: 10,
      maximum_purchase_quantity: 100,
      ncm_code: '03022300',
      sh_code: '0103.91',
      certifications: 'foo certifications',
      certifications_url: 'https://certifications.foo',
      prizes: 'Prizes bar',
      density: 'Some density',
      dimensions: 'Some dimensions',
      availability: 'foo availability'
    }
  end

  let(:material) do
    Material.create!(
      name: 'Foo material',
      description: 'Some description',
      average_price: 'R$ 111,00',
      code: '1234',
      supplier: supplier
    )
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
      reach: 'country'
    )
  end

  context 'without current_user' do
    let(:headers) { { 'access-token' => nil } }

    before do
      put "/materials/#{material.id}",
        headers: headers,
        params: params.to_json
    end

    it { expect(response).to have_http_status(:unauthorized) }
  end

  context 'with current_user' do
    context 'with all params' do
      before do
        put "/materials/#{material.id}",
          headers: headers,
          params: params.to_json
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(response.body).to eq(material.reload.to_json) }
    end

    context 'with only one param' do
      let(:params) { { image_url: 'http://another-image' } }

      before do
        put "/materials/#{material.id}",
          headers: headers,
          params: params.to_json
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(response.body).to eq(material.reload.to_json) }
    end
  end

  context 'with current_admin' do
    include_context 'with current_admin'

    context 'with all params' do
      before do
        put "/materials/#{material.id}",
          headers: headers,
          params: params.to_json
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(response.body).to eq(material.reload.to_json) }
      it { expect(response.headers['uid']).to eq(current_admin.email) }
    end

    context 'with only one param' do
      let(:params) { { image_url: 'http://another-image' } }

      before do
        put "/materials/#{material.id}",
          headers: headers,
          params: params.to_json
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(response.body).to eq(material.reload.to_json) }
    end
  end

  context 'with incorrect request' do
    let(:params) { { foo: 'bar' } }

    before { put "/materials/#{material.id}", params: params.to_json }

    it { expect(response).to have_http_status(:bad_request) }
  end
end
