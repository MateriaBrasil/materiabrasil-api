# frozen_string_literal: true

require 'rails_helper'

describe 'GET /categories', type: :request do
  let(:expected_body) { 'This is the body' }

  before do
    allow(Category).to receive(:root) { expected_body }

    get '/categories'
  end

  it { expect(response).to have_http_status(:ok) }
  it { expect(response.body).to eq(expected_body) }
end
