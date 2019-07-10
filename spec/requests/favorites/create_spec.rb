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

  context 'with incorrect params' do
    let(:params) { { foo: 'bar' } }

    before { post '/favorites', headers: headers, params: params.to_json }

    it { expect(response).to have_http_status(:bad_request) }
  end

  context 'without current_user' do
    let(:headers) { { 'access-token' => nil } }

    before { post '/favorites', headers: headers, params: params.to_json }

    it { expect(response).to have_http_status(:unauthorized) }
  end

  context 'with current_user' do
    context 'without album_id, when user has no albums' do
      before { post '/favorites', headers: headers, params: params.to_json }

      it { expect(response).to have_http_status(:created) }
      it { expect(response.body).to eq(favorite.to_json) }
      it { expect(favorite.favoritable).to eq(material) }
      it { expect(favorite.album).to eq(Album.first) }
      it { expect(favorite.album.default).to be(true) }
    end

    context 'without album_id, when user has a default album' do
      before do
        Album.create!(user: current_user, name: 'Foo Album', default: true)
        post '/favorites', headers: headers, params: params.to_json
      end

      it { expect(response).to have_http_status(:created) }
      it { expect(response.body).to eq(favorite.to_json) }
      it { expect(favorite.album.name).to eq('Foo Album') }
    end

    context 'with album_id' do
      let(:album) { Album.create!(user: current_user, name: 'Bar Album') }
      let(:params) do
        {
          favoritable_id: material.id,
          favoritable_type: 'Material',
          album_id: album.id
        }
      end

      before do
        Album.create!(user: current_user, name: 'Foo Album', default: true)
        post '/favorites', headers: headers, params: params.to_json
      end

      it { expect(response).to have_http_status(:created) }
      it { expect(response.body).to eq(favorite.to_json) }
      it { expect(favorite.album).to eq(album) }
    end
  end
end
