# frozen_string_literal: true

require 'rails_helper'

describe 'GET /albums/:id/favorites', type: :request do
  subject(:body) { JSON.parse(response.body) }

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

  before do
    %w[foo bar baz].each do |name|
      Material.create!(
        name: name,
        image_url: 'http://foo.bar',
        description: 'Some description',
        average_price: 'R$ 111,00',
        code: '1234',
        technical_specification_url: 'http://foo',
        usage: 'Bar usage',
        supplier: supplier
      )
    end
  end

  context 'with album not found' do
    let(:id) { album.id + 1 }

    before { get "/albums/#{id}/favorites", params: params }

    it { expect(response).to have_http_status(:not_found) }
  end

  context 'with album found' do
    before do
      materials = Material.all
      materials.each do |material|
        Favorite.create!(
          favoritable_id: material.id,
          favoritable_type: 'Material',
          album_id: album.id
        )
      end

      get "/albums/#{id}/favorites", params: params
    end

    it { expect(response).to have_http_status(:ok) }
    it { is_expected.to eq(JSON.parse(album.favorites.to_json)) }
    it { expect(body.length).to eq(3) }
  end

  context 'with incorrect request' do
    let(:params) { { foo: 'bar' } }

    before { get "/albums/#{id}/favorites", params: params }

    it { expect(response).to have_http_status(:bad_request) }
  end
end
