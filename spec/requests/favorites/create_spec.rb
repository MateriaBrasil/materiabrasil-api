# frozen_string_literal: true

require 'rails_helper'

describe 'POST /favorites', type: :request do
  let(:favorite) { Favorite.first }
  let(:headers) { {} }
  let(:params) do
    {
      favoritable_id: material.id,
      favoritable_type: 'Material',
      album_id: 0
    }
  end

  let(:album) { Album.first }

  let(:material) do
    Material.create!(
      name: 'Foo',
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

  before do
    post '/favorites', headers: headers, params: params.to_json
  end

  context 'with incorrect params' do
    let(:params) { { foo: 'bar' } }

    it { expect(response).to have_http_status(:bad_request) }
  end

  context 'without current_user' do
    let(:headers) { { 'access-token' => nil } }

    it { expect(response).to have_http_status(:unauthorized) }
  end

  context 'with current_user' do
    it { expect(response).to have_http_status(:created) }
    it { expect(response.body).to eq(favorite.to_json) }
    it { expect(favorite.favoritable).to eq(material) }

    context 'without album_id' do
      it 'creates a default album' do
        expect(favorite.album).to eq(album)
      end
      it { expect(favorite.album.default).to be(true) }
    end
  end
end
