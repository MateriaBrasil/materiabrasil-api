# frozen_string_literal: true

require 'rails_helper'

describe 'POST /auth/password', type: :request do
  let(:headers) { {} }
  let(:params) do
    { email: current_user.email, redirect_url: 'http://localhost:3000' }
  end

  context 'without params' do
    before do
      post '/auth/password', params: {}.to_json
    end

    it { expect(response).to have_http_status(:unauthorized) }

    it 'returns the correct error' do
      expect(response.body).to eq({
        success: false,
        errors: param_error
      }.to_json)
    end
  end

  context 'with correct params' do
    before do
      post '/auth/password', params: params.to_json
    end

    it { expect(response).to have_http_status(:ok) }

    it 'returns the success message' do
      expect(response.body).to eq({
        success: true,
        message: 'Você receberá um e-mail com instruções \
        sobre como redefinir sua senha.'
      }.to_json)
    end
  end

  def param_error
    ['Informe o endereço de e-mail.']
  end
end
