# frozen_string_literal: true

require 'rails_helper'

describe 'POST /reviews', type: :request do
  let(:headers) { {} }

  let(:to_supplier_params) do
    {
      to_id: supplier.id,
      to_type: 'Supplier',
      text: 'foo bar'
    }
  end

  let(:to_user_params) do
    {
      to_id: user.id,
      to_type: 'User',
      text: 'foo bar'
    }
  end

  let(:user) do
    User.create!(
      email: 'to_user@foo.com',
      first_name: 'To',
      last_name: 'User',
      password: '123456789',
      public_profile: false
    )
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
      number_of_employees: 1000,
      reach: 'country',
      image_url: 'http://foo-image'
    )
  end

  let(:message) { Message.first }

  context 'with incorrect params' do
    let(:params) { { message: { foo: 'bar' } } }

    before { post '/messages', headers: headers, params: params.to_json }

    it { expect(response).to have_http_status(:bad_request) }
  end

  context 'without current_user' do
    let(:headers) { { 'access-token' => nil } }

    before do
      post '/messages', headers: headers, params: to_supplier_params.to_json
    end

    it { expect(response).to have_http_status(:unauthorized) }
  end

  context 'when user to supplier' do
    before do
      post '/messages', headers: headers, params: to_supplier_params.to_json
    end

    it { expect(response).to have_http_status(:created) }
    it { expect(response.body).to eq(message.to_json) }
    it { expect(message.from).to eq(current_user) }
    it { expect(message.to).to eq(supplier) }
  end

  context 'when user to user' do
    before do
      post '/messages', headers: headers, params: to_user_params.to_json
    end

    it { expect(response).to have_http_status(:created) }
    it { expect(response.body).to eq(message.to_json) }
    it { expect(message.from).to eq(current_user) }
    it { expect(message.to).to eq(user) }
  end
end
