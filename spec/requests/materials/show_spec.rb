# frozen_string_literal: true

require 'rails_helper'

describe 'GET /materials/:id', type: :request do
  let(:material) do
    Material.create!(
      name: 'foo',
      image_url: 'http://foo.bar',
      description: 'Some description',
      average_price: 'R$ 111,00',
      code: '1234'
    )
  end

  let(:id) { material.id }

  before do
    get "/materials/#{id}"
  end

  context 'with material not found' do
    let(:id) { material.id + 1 }

    it 'returns not found' do
      expect(response).to have_http_status(:not_found)
    end
  end

  context 'with material found' do
    it 'returns ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns the material' do
      expect(response.body).to eq(material.to_json)
    end
  end
end
