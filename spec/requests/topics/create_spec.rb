# frozen_string_literal: true

require 'rails_helper'

describe 'POST /topics', type: :request do
  let(:topic) { Topic.first }
  let(:headers) { {} }
  let(:params) do
    {
      subject: 'foo subject',
      text: 'foo bar'
    }
  end

  context 'with incorrect params' do
    let(:params) { { foo: 'bar' } }

    before { post '/topics', headers: headers, params: params.to_json }

    it { expect(response).to have_http_status(:bad_request) }
  end

  context 'without current_user' do
    let(:headers) { { 'access-token' => nil } }

    before { post '/topics', headers: headers, params: params.to_json }

    it { expect(response).to have_http_status(:unauthorized) }
  end

  context 'with current_user' do
    before { post '/topics', headers: headers, params: params.to_json }

    it { expect(response).to have_http_status(:created) }
    it { expect(response.body).to eq(topic.to_json) }
    it { expect(topic.user).to eq(current_user) }
  end
end
