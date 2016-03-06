Rails.application.routes.draw do
  get 'tracks/index'

  resources :tracks

  resources :parties
  resources :videos
  resources :guests

  devise_for :users
  resources :users
  root to: 'visitors#index'
end
