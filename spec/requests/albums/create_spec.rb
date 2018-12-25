# frozen_string_literal: true

require 'rails_helper'

describe 'POST /albums', type: :request do
  let(:album) { Album.first }
  let(:headers) { {} }
  let(:params) do
    {
      name: 'foo bar'
    }
  end

  before do
    post '/albums', headers: headers, params: params.to_json
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
    it { expect(response.body).to eq(album.to_json) }
    it { expect(album.user).to eq(current_user) }
  end
end
