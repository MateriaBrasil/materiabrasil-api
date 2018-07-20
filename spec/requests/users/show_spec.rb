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

    context 'when accessing another user profile' do
      let(:user) do
        User.create!(
          name: 'bar foo',
          email: 'bar@foo.com',
          password: 123_456_789
        )
      end

      before { get "/users/#{user.id}", headers: headers }

      it { expect(response).to have_http_status(:ok) }
      it { expect(response.body).to eq(user.to_json) }
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
    it { expect(response.body).to eq(current_user.to_json) }
  end
end