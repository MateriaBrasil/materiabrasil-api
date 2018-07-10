# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :materials, only: %i[index show] do
    get 'comments', on: :member
  end
  resources :comments, only: %i[create]
  resources :favorites, only: %i[create destroy]
  resources :users, only: %i[show]
  resources :albums, only: %i[] do
    get 'favorites', on: :member
  end
end
