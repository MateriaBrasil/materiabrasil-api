# frozen_string_literal: true

require 'rails_helper'

describe 'GET /materials/:id/comments', type: :request do
  subject(:body) { JSON.parse(response.body) }

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

  let(:id) { material.id }
  let(:params) { nil }

  before do
    %w[foo bar baz].each do |text|
      Comment.create!(
        commentable_id: material.id,
        commentable_type: 'Material',
        text: text,
        user: current_user
      )
    end

    get "/materials/#{id}/comments", params: params
  end

  context 'with material not found' do
    let(:id) { material.id + 1000 }

    it 'returns not found' do
      expect(response).to have_http_status(:not_found)
    end
  end

  context 'with material found' do
    it { expect(response).to have_http_status(:ok) }
    it { is_expected.to eq(JSON.parse(material.comments.to_json)) }
    it { expect(body.length).to eq(3) }
  end

  context 'with bad request' do
    let(:params) { { foo: 'bar' } }

    it { expect(response).to have_http_status(:bad_request) }
  end
end
