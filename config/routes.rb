# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :materials, only: %i[index show]
  resources :comments, only: %i[create]
end
