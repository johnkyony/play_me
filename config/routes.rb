Rails.application.routes.draw do
  get 'tracks/index'

  resources :tracks

  resources :invitations do
      put 'accept', on: :member
      put 'decline'
  end

  resources :parties do
    resources :guests
    resources :invitations
  end

  resources :parties
  resources :videos
  resources :guests

  devise_for :users
  resources :users
  root to: 'visitors#index'
end

