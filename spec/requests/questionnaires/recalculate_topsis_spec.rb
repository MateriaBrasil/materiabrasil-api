# frozen_string_literal: true

require 'rails_helper'

describe 'POST /recalculate_topsis', type: :request do
  context 'when admin is logged in' do
    include_context 'with current_admin'
    
    before do
      post '/recalculate_topsis', headers: {}, params: {}.to_json
    end

    it { expect(response).to have_http_status(:created) }
    it { expect(response.body).to eq({ ok: true }.to_json) }
    it { expect(CalculateAllTopsisJob).to have_been_enqueued }
  end
  
  context 'when admin is NOT logged in' do
    before do
      post '/recalculate_topsis', headers: {}, params: {}.to_json
    end

    it { expect(response).to have_http_status(:forbidden) }
    it { expect(response.body).not_to eq({ ok: true }.to_json) }
    it { expect(CalculateAllTopsisJob).not_to have_been_enqueued }
  end
end
