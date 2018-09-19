# frozen_string_literal: true

require 'rails_helper'

describe 'GET /topics/:id/comments', type: :request do
  subject(:body) { JSON.parse(response.body) }

  let(:topic) do
    Topic.create!(
      subject: 'foo',
      text: 'bar',
      user: current_user
    )
  end

  let(:id) { topic.id }
  let(:params) { nil }

  before do
    %w[foo bar baz].each do |text|
      Comment.create!(
        commentable_id: topic.id,
        commentable_type: 'Topic',
        text: text,
        user: current_user
      )
    end

    get "/topics/#{id}/comments", params: params
  end

  context 'with topic not found' do
    let(:id) { topic.id + 1000 }

    it 'returns not found' do
      expect(response).to have_http_status(:not_found)
    end
  end

  context 'with topic found' do
    it { expect(response).to have_http_status(:ok) }
    it { is_expected.to eq(JSON.parse(topic.comments.to_json)) }
    it { expect(body.length).to eq(3) }
  end

  context 'with bad request' do
    let(:params) { { foo: 'bar' } }

    it { expect(response).to have_http_status(:bad_request) }
  end
end
