Rails.application.routes.draw do
  get 'tracks/index'

  resources :tracks

  resources :parties do
    resources :guests    
    
  end

  resources :parties do 
    resources :guests 
  end

  resources :parties
  resources :videos
  resources :guests

  devise_for :users
  resources :users
  root to: 'visitors#index'
end
