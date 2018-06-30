# frozen_string_literal: true

require 'rails_helper'

describe 'POST /comments', type: :request do
  let(:comment) { Comment.first }
  let(:headers) { {} }
  let(:params) do
    {
      text: 'foo bar',
      commentable_id: material.id
    }
  end

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
    post '/comments', headers: headers, params: params.to_json
  end

  context 'with incorrect params' do
    let(:params) { { foo: 'bar' } }

    it 'returns bad request' do
      expect(response).to have_http_status(:bad_request)
    end
  end

  context 'without current_user' do
    let(:headers) { { 'access-token' => nil } }

    it 'returns unauthorized' do
      expect(response).to have_http_status(:unauthorized)
    end
  end

  context 'with current_user' do
    it 'returns created' do
      expect(response).to have_http_status(:created)
    end

    it 'returns the correct body' do
      expect(response.body).to eq(comment.to_json)
    end

    it 'associates with current user' do
      expect(comment.user).to eq(current_user)
    end

    it 'associates with commentable' do
      expect(comment.commentable).to eq(material)
    end
  end
end
