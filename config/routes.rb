Rails.application.routes.draw do
  root 'home#show'
  resource :cart, only: [:index, :show]

  resources :account, only: [:show, :update]
  resources :caravans, only: [:show]
  get 'orders', to: 'orders#index'
  get 'nomad_connect', to: 'nomad_connect#index'
  get 'shared_experiences', to: 'shared_experiences#index'
  get 'settings', to: 'settings#index'
  
  get 'nomad_connect/join', to: 'nomad_connect#join', as: 'join_group'
  get 'nomad_connect/view', to: 'nomad_connect#view', as: 'view_group'

  resources :groups
  #get 'groups/new', to: 'groups#new', as: 'new_group'
  post 'groups', to: 'groups#create'

  devise_for :users
end
