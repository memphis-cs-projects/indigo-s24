Rails.application.routes.draw do
  root 'home#show'
  resources :cart, only: [:index, :create, :destroy]
  resources :account, only: [:show, :update]
  get 'orders', to: 'orders#index'
  get 'nomad_connect', to: 'nomad_connect#index'
  get 'shared_experiences', to: 'shared_experiences#index'
  get 'settings', to: 'settings#index'


  
  get 'nomad_connect/join', to: 'nomad_connect#join', as: 'join_group'
  get 'nomad_connect/view', to: 'nomad_connect#view', as: 'view_group'

  resources :groups, only: [:new, :create]
  get 'nomad_connect/create', to: 'groups#create'

  devise_for :users
end
