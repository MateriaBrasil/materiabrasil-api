# frozen_string_literal: true

require 'rails_helper'

describe 'POST /auth', type: :request do
  let(:user) do
    {
      first_name: 'foo',
      last_name: 'bar',
      email: 'bar@foo.com',
      password: '123456789'
    }
  end

  let(:headers) { {} }
  let(:params) { {} }

  before do
    post '/auth', params: params.to_json
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
    let(:params) { user }

    it { expect(response).to have_http_status(:ok) }

    it 'returns the created user' do
      expect(response.body).to eq({
        status: 'success',
        data: User.last
      }.to_json)
    end
  end

  def param_error
    ['Os dados submetidos na requisição de cadastro são inválidos.']
  end
end
