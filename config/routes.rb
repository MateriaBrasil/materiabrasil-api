# frozen_string_literal: true

Rails.application.routes.draw do
  resources :materials, only: %i[index show]
end
