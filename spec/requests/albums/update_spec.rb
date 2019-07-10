# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PUT /album/:id', type: :request do
  let(:headers) { {} }
  let(:params) do
    {
      private: true
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

  let(:album) do
    Album.create!(
      name: 'foo',
      user: current_user,
      default: true,
      private: false
    )
  end

  context 'without current_user' do
    let(:headers) { { 'access-token' => nil } }

    before do
      put "/albums/#{album.id}",
        headers: headers,
        params: params.to_json
    end

    it { expect(response).to have_http_status(:unauthorized) }
  end

  context 'with current_user' do
    context 'with one param' do
      before do
        put "/albums/#{album.id}",
          headers: headers,
          params: params.to_json
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(response.body).to eq(album.reload.to_json) }
    end
  end

  context 'with incorrect request' do
    let(:params) { { foo: 'bar' } }

    before { put "/albums/#{album.id}", params: params.to_json }

    it { expect(response).to have_http_status(:bad_request) }
  end
end
