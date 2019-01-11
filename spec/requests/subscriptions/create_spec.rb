# frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe 'POST /subscriptions/create', type: :request do
#   subject { response }

#   let!(:user) do
#     User.create!(
#       email: 'bar@baz.com',
#       first_name: 'jane',
#       last_name: 'doe',
#       password: '12345678',
#       iugu_id: '1'
#     )
#   end

#   context 'without current user' do
#     before do
#       post '/subscriptions'
#     end

#     it { is_expected.to redirect_to(new_user_registration_path) }
#     it 'shows a message' do
#       expect(flash[:info]).to be_present
#     end
#   end

#   context 'when api payment method fails' do
#     before do
#       stub_payment_request(500)
#       # sign_in user
#       post '/subscriptions'
#     end

#     it { is_expected.to redirect_to(root_path) }
#     it 'shows an error message' do
#       expect(flash[:failure]).to be_present
#     end
#   end

#   context 'when api subscription fails' do
#     before do
#       stub_payment_request(200)
#       stub_subscription_request(status: 500)
#       # sign_in user
#       post '/subscriptions', params: { subscription: { } }
#     end

#     it { is_expected.to redirect_to(root_path) }
#     it 'shows an error message' do
#       expect(flash[:failure]).to be_present
#     end
#   end

#   context 'when subscription is created' do
#     context 'without an affiliate_tag' do
#       before do
#         stub_payment_request(200)
#         stub_subscription_request(status: 200, body: { id: '1' }.to_json)
#         # sign_in user
#         post '/subscriptions', params: {
#           subscription: { }
#         }
#       end

#       it { is_expected.to redirect_to(user.subscription) }

#       subject(:subscription) { Subscription.first }

#       it { expect(subscription.user).to eq(user) }
#       it { expect(subscription.state).to eq('pending') }
#       it { expect(subscription.recurrence).to eq('monthly') }
#       it { expect(subscription.payment_method).to be(nil) }
#       it { expect(subscription.activated_at).to be(nil) }
#       it { expect(subscription.affiliate_tag).to be(nil) }
#     end

#     context 'with an affiliate_tag' do
#       before do
#         stub_payment_request(200)
#         stub_subscription_request(status: 200, body: { id: '1' }.to_json)
#         # sign_in user
#         get '/', params: { aff: 'aff123' }
#         post '/subscriptions', params: {
#           subscription: { recurrence: 'monthly' }
#         }
#       end

#       it { is_expected.to redirect_to(user.subscription) }

#       subject(:subscription) { Subscription.first }

#       it { expect(subscription.user).to eq(user) }
#       it { expect(subscription.state).to eq('pending') }
#       it { expect(subscription.recurrence).to eq('monthly') }
#       it { expect(subscription.payment_method).to be(nil) }
#       it { expect(subscription.activated_at).to be(nil) }
#       it { expect(subscription.affiliate_tag).to eq('aff123') }
#     end
#   end
# end

# def stub_payment_request(status)
#   stub_request(:post, "#{base_url}/customers/1/payment_methods")
#     .with(
#       body: {
#         description: 'Cartão de crédito',
#         set_as_default: true,
#         customer_id: user.iugu_id,
#         token: nil
#       }.to_json,
#       headers: headers
#     ).to_return(status: status)
# end

# def stub_subscription_request(to_return)
#   stub_request(:post, "#{base_url}/subscriptions")
#     .with(
#       body: {
#         credits_based: false,
#         plan_identifier: 'monthly',
#         customer_id: user.iugu_id
#       }.to_json,
#       headers: headers
#     ).to_return(to_return)
# end

# def base_url
#   'https://api.iugu.com/v1'
# end

# def headers
#   {
#     'Accept' => 'application/json',
#     'Authorization' => /Basic .+/,
#     'Content-Type' => 'application/json',
#     'Host' => 'api.iugu.com:443'
#   }
# end
