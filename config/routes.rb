Rails.application.routes.draw do
  get 'memories/create'
  get 'memories/destroy'
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:new, :create, :edit, :update]
  resources :memories, only: [:create, :destroy]
end
