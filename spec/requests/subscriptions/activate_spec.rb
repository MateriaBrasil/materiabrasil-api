# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST /subscriptions/activate', type: :request do
  subject { response }

  let(:params) do
    {
      data: {
        id: '1'
      }
    }.to_json
  end

  let!(:user) do
    User.create!(
      email: 'bar@baz.com',
      first_name: 'jane',
      last_name: 'doe',
      password: '12345678',
      iugu_id: '1'
    )
  end

  let!(:subscription) do
    Subscription.create!(user: user, iugu_id: '1')
  end

  context 'with valid subscription iugu_id' do
    before do
      post '/subscriptions/activate', params: params
    end

    it { is_expected.to have_http_status(204) }

    it 'activates the subscription' do
      expect(subscription.reload.state).to eq('active')
    end

    it 'updates the activated_at attribute' do
      expect(subscription.reload.activated_at).not_to be(nil)
    end
  end
end
