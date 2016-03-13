Rails.application.routes.draw do
  get 'tracks/index'
  post 'invitations/accept',  :to => 'invitations#accept'

  resources :tracks

  resources :parties do
    resources :guests
    resources :invitations
  end

  resources :guest_invatations
  resources :parties
  resources :videos
  resources :guests
  resources :invitations

  devise_for :users
  resources :users
  root to: 'visitors#index'
end

