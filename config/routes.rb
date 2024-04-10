Rails.application.routes.draw do
  root 'home#show'
  resource :cart, only: [:index, :show]

  resources :account, only: [:show, :update]
  resources :caravans, only: [:show]
  get 'orders', to: 'orders#index'
  get 'nomad_connect', to: 'nomad_connect#index'
  get 'shared_experiences', to: 'shared_experiences#index'
  get 'settings', to: 'settings#index'
  devise_for :users
end
