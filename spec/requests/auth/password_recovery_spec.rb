# frozen_string_literal: true

require 'rails_helper'

describe 'PUT /auth/password', type: :request do
  let(:headers) do
    token_header = current_user.create_new_auth_token
    
    { 'uid': current_user.email,
      'client': token_header['client'],
      'access-token': token_header['access-token'] }
  end

  let(:params) do
    { password: 'new_password',
      password_confirmation: 'new_password' }
  end

  context 'without params' do
    before do
      put '/auth/password', params: {}.to_json, headers: headers
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
      put '/auth/password', params: params.to_json, headers: headers
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(JSON.parse(response.body)['success']).to eq(true) }
    it {
      expect(JSON.parse(response.body)['message']).to eq(
        'Senha atualizada com sucesso.'
      ) }
  end

  def param_error
    ['Unauthorized']
  end
end
