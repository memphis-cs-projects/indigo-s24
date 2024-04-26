Rails.application.routes.draw do
  root 'home#show'
  namespace :admin do
    resources :caravans, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    get '/', to: 'admin#index', as: 'dashboard'
    get 'manage_listings', to: 'admin#manage_listings', as: 'manage_listings'
    get 'view_orders', to: 'admin#view_orders', as: 'view_orders'
  end
  resource :cart, only: [:show] do
    post 'add_item', on: :member
  end
  resources :orders, only: [:show, :create, :new]
  resources :account, only: [:show, :update]
  resources :caravans, only: [:show, :index]
  resources :cart_items, only: [:create, :update, :destroy]
  resources :profiles
  resources :payments
  post 'profiles', to: 'profiles#create'
  post 'payments', to: 'payments#create'
  get 'orders', to: 'orders#index'
  get 'nomad_connect', to: 'nomad_connect#index'
  get 'shared_experiences', to: 'shared_experiences#index'
  get 'settings', to: 'settings#index'

  # Routes for joining and viewing groups
  # get 'nomad_connect/join', to: 'groups#join_group', as: 'join_group'
  get 'nomad_connect/view_group', to: 'groups#view_group', as: 'view_group'
  
  get 'view_group', to: 'groups#view_group'
  delete 'groups/:id', to: 'groups#destroy', as: 'delete_group'
  get 'join_group/:group_id', to: 'groups#join', as: 'join_group'

  get 'joined_groups', to: 'groups#joined_groups', as: 'joined_groups'



  get 'view_details', to: 'home#index', as: 'details'
  resources :groups
  #get 'groups/new', to: 'groups#new', as: 'new_group'
  post 'groups', to: 'groups#create'

  devise_for :users
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
end
