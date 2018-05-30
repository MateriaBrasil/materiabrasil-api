# frozen_string_literal: true

require 'rails_helper'

describe 'GET /materials', type: :request do
  before do
    %w[foo bar baz].each do |name|
      Material.create!(
        name: name,
        image_url: 'http://foo.bar',
        description: 'Some description',
        average_price: 'R$ 111,00',
        code: '1234'
      )
    end
  end

  let(:materials) do
    Material.all
  end

  context 'with materials' do
    before do
      get '/materials'
    end

    it 'returns ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders materials' do
      expect(response.body).to eq(materials.to_json)
    end
  end
end
