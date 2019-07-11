# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /users/:id', type: :request do
  let(:headers) { {} }

  context 'without current_user' do
    let(:headers) { { 'access-token' => nil } }

    before { get "/users/#{current_user.id}", headers: headers }

    it { expect(response).to have_http_status(:ok) }
    it { expect(response.body).to eq(current_user.to_json) }
  end

  context 'with current_user' do
    context 'when accessing her own profile' do
      before { get "/users/#{current_user.id}", headers: headers }

      it { expect(response).to have_http_status(:ok) }
      it { expect(response.body).to eq(current_user.to_json) }
    end

    context 'when accessing a public user profile' do
      let(:other_user) do
        User.create!(
          first_name: 'Foo',
          last_name: 'Bar',
          email: 'bar@foo.com',
          password: 123_456_789,
          public_profile: true
        )
      end

      before { get "/users/#{other_user.id}", headers: headers }

      it { expect(response).to have_http_status(:ok) }
      it { expect(response.body).to eq(other_user.to_json) }
    end

    context 'when accessing a private user profile' do
      let(:other_user) do
        User.create!(
          first_name: 'Foo',
          last_name: 'Bar',
          email: 'bar@foo.com',
          password: 123_456_789,
          public_profile: false
        )
      end

      before { get "/users/#{other_user.id}", headers: headers }

      it { expect(response).to have_http_status(:forbidden) }
    end
  end

  context 'with incorrect request' do
    before { get "/users/#{current_user.id}", params: { foo: 'bar' } }

    it { expect(response).to have_http_status(:bad_request) }
  end

  context 'when user has albums' do
    before do
      Album.create!(user: current_user, name: 'Foo Album', default: true)
      Album.create!(user: current_user, name: 'Bar Album')
      get "/users/#{current_user.id}"
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(response.body).to eq(current_user.reload.to_json) }
    it { expect(JSON.parse(response.body)['albums'].length).to be(2) }
  end

  context 'when user has suppliers' do
    before do
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
        reach: 'country'
      )

      get "/users/#{current_user.id}"
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(response.body).to eq(current_user.reload.to_json) }
    it { expect(JSON.parse(response.body)['suppliers'].length).to be(1) }
  end
end
