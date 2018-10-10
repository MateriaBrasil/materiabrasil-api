# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PUT /users/:id', type: :request do
  let(:headers) { {} }
  let(:params) do
    {
      image_url: 'http://foo',
      city: 'Foo city',
      state: 'Foo state',
      country: 'Foo country',
      bio: 'Lorem ipsum foo bar',
      company: 'Foo company',
      work_title: 'Foo title',
      website: 'http://bar',
      email: 'bar@bar.com'
    }
  end

  context 'without current_user' do
    let(:headers) { { 'access-token' => nil } }

    before do
      put "/users/#{current_user.id}",
        headers: headers,
        params: params.to_json
    end

    it { expect(response).to have_http_status(:unauthorized) }
  end

  context 'with current_user' do
    context 'with all params' do
      before do
        put "/users/#{current_user.id}",
          headers: headers,
          params: params.to_json
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(response.body).to eq(current_user.reload.to_json) }
      it { expect(current_user.reload.uid).to eq('bar@bar.com') }
    end

    context 'with only one param' do
      let(:params) { { city: 'bar city ' } }

      before do
        put "/users/#{current_user.id}",
          headers: headers,
          params: params.to_json
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(response.body).to eq(current_user.reload.to_json) }
    end

    context 'with email already in use' do
      let(:create_user) do
        User.create!(
          email: 'bar@bar.com',
          first_name: 'Foo',
          last_name: 'Bar',
          password: 'foobarfoo'
        )
      end

      let(:error_response) do
        {
          id: 'used_email',
          message: 'Este e-mail já está em uso. Escolha outro e-mail por favor.'
        }.to_json
      end

      before do
        create_user
        put "/users/#{current_user.id}",
          headers: headers,
          params: params.to_json
      end

      it { expect(response).to have_http_status(:conflict) }
      it { expect(response.body).to eq(error_response) }
    end
  end

  context 'with incorrect request' do
    let(:params) { { foo: 'bar' } }

    before { put "/users/#{current_user.id}", params: params.to_json }

    it { expect(response).to have_http_status(:bad_request) }
  end
end
