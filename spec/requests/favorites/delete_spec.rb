# frozen_string_literal: true

require 'rails_helper'

describe 'DELETE /favorites/:id', type: :request do
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

  let(:album) do
    Album.create!(
      name: 'foo',
      user: current_user,
      default: true
    )
  end

  let(:favorite) do
    Favorite.create!(
      favoritable_id: material.id,
      favoritable_type: 'Material',
      album_id: album.id
    )
  end

  let(:id) { favorite.id }
  let(:params) { nil }

  context 'with favorite not found' do
    let(:id) { favorite.id + 1 }

    before { delete "/favorites/#{id}", params: params }

    it { expect(response).to have_http_status(:not_found) }
  end

  context 'with favorite found' do
    context 'when it belongs to current_user' do
      before { delete "/favorites/#{id}", params: params }

      it { expect(response).to have_http_status(:ok) }
      it { expect(response.body).to eq(favorite.to_json) }
      it { expect(Favorite.find_by(id: favorite.id)).to be(nil) }
    end

    context 'when it belongs to another user' do
      let(:user) do
        User.create!(
          email: 'bar@foo.com',
          first_name: 'Foo',
          last_name: 'Bar',
          password: 'foobarfoo'
        )
      end

      let(:album) do
        Album.create!(
          name: 'foo',
          user: user,
          default: true
        )
      end

      before { delete "/favorites/#{id}", params: params }

      it { expect(response).to have_http_status(:forbidden) }
    end
  end

  context 'with incorrect request' do
    let(:params) { { foo: 'bar' } }

    before { delete "/favorites/#{id}", params: params }

    it { expect(response).to have_http_status(:bad_request) }
  end
end
