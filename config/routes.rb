# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :materials, only: %i[index show create update] do
    get 'comments', on: :member
    get 'reviews', on: :member
  end
  resources :addresses, only: %i[create]
  resources :comments, only: %i[create]
  resources :reviews, only: %i[create]
  resources :favorites, only: %i[create destroy]
  resources :users, only: %i[show update]

  resources :suppliers, only: %i[show create update] do
    get 'addresses', on: :member
  end

  resources :albums, only: %i[] do
    get 'favorites', on: :member
  end
  resource :search, only: %i[show]

  resource :material_categories, only: %i[create]
end
