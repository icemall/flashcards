# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  resources :cards
  resources :decks
  resources :sessions
  resources :tests, only: %i[new create]
  resources :users
  get 'login' => 'sessions#new', as: :login
  post 'logout' => 'sessions#destroy', as: :logout

  post 'oauth/callback' => 'oauths#callback'
  get 'oauth/callback' => 'oauths#callback' # for use with Github, Facebook
  get 'oauth/:provider' => 'oauths#oauth', :as => :auth_at_provider
end
