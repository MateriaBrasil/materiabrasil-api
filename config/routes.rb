# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    passwords: 'auth/passwords'
  }

  resources :materials, only: %i[index show create update destroy] do
    get 'comments', on: :member
    get 'reviews', on: :member
    get 'categories', on: :member
    get 'answers', on: :member
  end
  
  resources :leads, only: %i[create]

  resources :addresses, only: %i[create]
  resources :comments, only: %i[create]
  resources :answers, only: %i[create destroy]

  resources :topics, only: %i[index show create] do
    get :comments, on: :member
  end

  resources :reviews, only: %i[create]
  resources :favorites, only: %i[create destroy]
  resources :users, only: %i[show update]

  resources :suppliers, only: %i[show create update] do
    get 'addresses', on: :member
    get 'answers', on: :member
    get 'todas_respondidas', on: :member
  end

  resources :albums, only: %i[show create update] do
    get 'favorites', on: :member
  end

  resource :search, only: %i[show]
  resources :categories, only: %i[index]
  resources :material_categories, only: %i[create destroy]
  resources :album_users, only: %i[create]
  resources :messages, only: %i[create]
  resources :questionnaires, only: %i[index]

  resources :subscriptions, only: %i[create show] do
    post :activate, on: :collection
  end

  post 'recalculate_topsis', to: 'questionnaires#recalculate_topsis'
end
# rubocop:enable Metrics/BlockLength
