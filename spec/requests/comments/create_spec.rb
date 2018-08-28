# frozen_string_literal: true

require 'rails_helper'

describe 'POST /comments', type: :request do
  let(:comment) { Comment.first }
  let(:headers) { {} }
  let(:params) do
    {
      text: 'foo bar',
      commentable_id: material.id,
      commentable_type: 'Material'
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
      properties: 'Foo properties',
      usage: 'Bar usage',
      supplier: supplier
    )
  end

  before do
    post '/comments', headers: headers, params: params.to_json
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
    it { expect(response.body).to eq(comment.to_json) }
    it { expect(comment.user).to eq(current_user) }
    it { expect(comment.commentable).to eq(material) }
  end
end
