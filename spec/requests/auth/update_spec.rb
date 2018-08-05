# frozen_string_literal: true

require 'rails_helper'

describe 'PUT /auth', type: :request do
  let(:headers) { {} }
  let(:params) { {} }

  before do
    put '/auth', params: params.to_json
  end

  context 'without params' do
    it { expect(response).to have_http_status(:unprocessable_entity) }

    it 'returns the correct error' do
      expect(response.body).to eq({
        success: false,
        errors: param_error,
        status: 'error'
      }.to_json)
    end
  end

  context 'with correct params' do
    let(:params) do
      {
        image_url: 'http://foo.bar',
        city: 'foocity',
        state: 'foostate',
        country: 'foocountry',
        bio: 'some great bio',
        company: 'foo company',
        work_title: 'foo title',
        website: 'http://foo.bar'
      }
    end

    it { expect(response).to have_http_status(:ok) }

    it 'returns the updated user' do
      expect(response.body).to eq({
        status: 'success',
        data: current_user.reload
      }.to_json)
    end
  end

  def param_error
    ['Os dados submetidos para atualização de conta são inválidos.']
  end
end
