# frozen_string_literal: true

require 'rails_helper'

describe 'GET /albums/:id', type: :request do
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

  let(:album) do
    Album.create!(
      name: 'foo',
      user: current_user,
      default: true
    )
  end

  let(:id) { album.id }
  let(:params) { nil }

  context 'with album not found' do
    let(:id) { album.id + 1 }

    before { get "/albums/#{id}", params: params }

    it { expect(response).to have_http_status(:not_found) }
  end

  context 'with album found' do
    before { get "/albums/#{id}", params: params }

    it { expect(response).to have_http_status(:ok) }
    it { expect(response.body).to eq(album.to_json) }
  end

  context 'with incorrect request' do
    let(:params) { { foo: 'bar' } }

    before { get "/albums/#{id}", params: params }

    it { expect(response).to have_http_status(:bad_request) }
  end
end
