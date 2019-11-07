# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  resources :cards
  resources :tests, only: %i[index new create]
end
