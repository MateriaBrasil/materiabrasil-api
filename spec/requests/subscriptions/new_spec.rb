# frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe 'GET /subscriptions/new', type: :request do
#   subject { response }

#   context 'without a logged in user' do
#     before do
#       get '/subscriptions/new'
#     end

#     it { is_expected.to have_http_status(:ok) }
#   end

#   context 'with a logged in user' do
#     let!(:user) do
#       User.create!(
#         first_name: 'jane',
#         last_name: 'doe',
#         email: 'bar@baz.com',
#         password: '123456',
#         cpf: '1234567890',
#         address: 'foo',
#         address_number: '42',
#         zip_code: '123',
#         city: 'foo',
#         state: 'foo'
#       )
#     end

#     context 'that has no subscription' do
#       before do
#         sign_in user
#         get '/subscriptions/new'
#       end

#       it { is_expected.to have_http_status(:ok) }
#     end

#     context 'that has a subscription' do
#       before do
#         Subscription.create!(user: user, recurrence: 'monthly')
#         sign_in user
#         get '/subscriptions/new'
#       end

#       it { is_expected.to redirect_to(user.subscription) }
#     end
#   end
# end
