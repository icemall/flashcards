# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  resources :cards
  resources :tests, only: %i[new create]
  resources :users
  resources :sessions
  get 'login' => 'sessions#new', as: :login
  post 'logout' => 'sessions#destroy', as: :logout
end
