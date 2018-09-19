# frozen_string_literal: true

require 'rails_helper'

describe 'GET /topics', type: :request do
  let(:topics) { Topic.all }

  before do
    %w[foo bar baz].each do |text|
      Topic.create!(
        text: text,
        subject: text,
        user: current_user
      )
    end
  end

  context 'with topics' do
    before { get '/topics' }

    it { expect(response).to have_http_status(:ok) }
    it { expect(response.body).to eq(topics.reverse.to_json) }
    it { expect(JSON.parse(response.body).length).to be(3) }
  end

  context 'with incorrect request' do
    before { get '/topics', params: { foo: 'bar' } }

    it { expect(response).to have_http_status(:bad_request) }
  end
end
