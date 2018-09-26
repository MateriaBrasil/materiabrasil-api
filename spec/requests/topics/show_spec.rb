# frozen_string_literal: true

require 'rails_helper'

describe 'GET /topics/:id', type: :request do
  let(:topic) do
    Topic.create!(
      user: current_user,
      subject: 'Foo bar',
      text: 'Foo text'
    )
  end

  let(:id) { topic.id }
  let(:params) { nil }

  context 'with topic not found' do
    let(:id) { topic.id + 1 }

    before { get "/topics/#{id}", params: params }

    it { expect(response).to have_http_status(:not_found) }
  end

  context 'with topic found' do
    before { get "/topics/#{id}", params: params }

    it { expect(response).to have_http_status(:ok) }
    it { expect(response.body).to eq(topic.to_json) }
  end

  context 'with incorrect request' do
    let(:params) { { foo: 'bar' } }

    before { get "/topics/#{id}", params: params }

    it { expect(response).to have_http_status(:bad_request) }
  end
end
