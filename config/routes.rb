Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'albums/index' => 'albums#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :users do
    member do
      get :followings
      get :followers
      get :addings
    end
  end
  resources :memories, only: [:new, :create, :edit, :update, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :add_memories, only: [:create, :destroy]
end
