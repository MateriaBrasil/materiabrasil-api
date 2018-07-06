# frozen_string_literal: true

require 'rails_helper'

describe 'GET /albums/:id/favorites', type: :request do
  subject(:body) { JSON.parse(response.body) }

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
        supplier_name: 'Foo Supplier',
        supplier_contact: 'foo@bar.com',
        manufacturing_location: 'Foo City/FO',
        sales_location: 'Bar City/BR',
        technical_specification_url: 'http://foo',
        properties: 'Foo properties',
        usage: 'Bar usage'
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
