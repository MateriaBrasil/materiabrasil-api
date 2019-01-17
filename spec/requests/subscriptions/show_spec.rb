# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /subscriptions/:id', type: :request do
  subject { response }

  context 'with logged in user' do
    let!(:subscription) do
      Subscription.create!(user: current_user, iugu_id: current_user.iugu_id)
    end

    before do
      get "/subscriptions/#{subscription[:id]}"
    end

    it { expect(response).to have_http_status(:ok) }
    it { expect(response.body).to eq(subscription.to_json) }
  end
end
