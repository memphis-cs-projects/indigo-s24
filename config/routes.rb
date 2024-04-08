Rails.application.routes.draw do
  root 'home#show'
  resources :cart, only: [:index, :create, :destroy]
  resources :account, only: [:show, :update]
  get 'orders', to: 'orders#index'
  get 'nomad_connect', to: 'nomad_connect#index'
  get 'shared_experiences', to: 'shared_experiences#index'
  get 'settings', to: 'settings#index'
  devise_for :users
end
