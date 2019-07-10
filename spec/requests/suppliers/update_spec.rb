# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PUT /supplier/:id', type: :request do
  let(:headers) { {} }
  let(:params) do
    {
      name: 'Bar Foo',
      description: 'Bar description',
      website: 'http://bar',
      email: 'bar@company.com',
      cnpj: '987654321',
      company_name: 'Bar Inc',
      municipal_subscription: '123456',
      state_subscription: 'none',
      phone: '5551123456789',
      reach: 'global',
      company_revenue: '100000000',
      type_of_company: 1,
      image_url: 'http://foo'
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
      reach: 'country'
    )
  end

  context 'without current_user' do
    let(:headers) { { 'access-token' => nil } }

    before do
      put "/suppliers/#{supplier.id}",
        headers: headers,
        params: params.to_json
    end

    it { expect(response).to have_http_status(:unauthorized) }
  end

  context 'with current_user' do
    context 'with all params' do
      before do
        put "/suppliers/#{supplier.id}",
          headers: headers,
          params: params.to_json
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(response.body).to eq(supplier.reload.to_json) }
    end

    context 'with only one param' do
      let(:params) { { image_url: 'http://another-image' } }

      before do
        put "/suppliers/#{supplier.id}",
          headers: headers,
          params: params.to_json
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(response.body).to eq(supplier.reload.to_json) }
    end
  end

  context 'with current_admin' do
    include_context 'with current_admin'

    context 'with all params' do
      before do
        put "/suppliers/#{supplier.id}",
          headers: headers,
          params: params.to_json
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(response.body).to eq(supplier.reload.to_json) }
      it { expect(response.headers['uid']).to eq(current_admin.email) }
    end

    context 'with only one param' do
      let(:params) { { image_url: 'http://another-image' } }

      before do
        put "/suppliers/#{supplier.id}",
          headers: headers,
          params: params.to_json
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(response.body).to eq(supplier.reload.to_json) }
    end
  end

  context 'with incorrect request' do
    let(:params) { { foo: 'bar' } }

    before { put "/suppliers/#{supplier.id}", params: params.to_json }

    it { expect(response).to have_http_status(:bad_request) }
  end
end
