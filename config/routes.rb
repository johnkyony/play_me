Rails.application.routes.draw do
  get 'tracks/index'
  post 'invitations/accept',  :to => 'invitations#accept'

  resources :tracks
  resources :playlists

  resources :invitations do
    member do
      put 'accept'
      put 'decline'
    end
  end

  resources :parties do
    resources :guests
    resources :invitations
    resources :playlists
    resources :videos
  end

  resources :parties
  resources :videos
  resources :guests
  resources :invitations 


  devise_for :users
  resources :users

  get 'videos/index'
  post 'videos/index'
  
  root to: 'parties#index'
end

